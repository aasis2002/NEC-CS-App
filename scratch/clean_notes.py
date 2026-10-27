import os
import re
from html import unescape

def html_table_to_md(table_html):
    # Extract headers
    headers = []
    # Find all th in thead or first tr
    th_matches = re.findall(r'<th[^>]*>(.*?)</th>', table_html, re.DOTALL | re.IGNORECASE)
    if th_matches:
        for th in th_matches:
            clean_th = re.sub(r'<[^>]+>', '', th).strip()
            headers.append(clean_th if clean_th else ' ')
    
    # Extract rows
    rows = []
    tr_matches = re.findall(r'<tr[^>]*>(.*?)</tr>', table_html, re.DOTALL | re.IGNORECASE)
    
    for tr in tr_matches:
        td_matches = re.findall(r'<td[^>]*>(.*?)</td>', tr, re.DOTALL | re.IGNORECASE)
        if td_matches:
            row = []
            for td in td_matches:
                # keep bold/code in td
                clean_td = re.sub(r'<strong[^>]*>(.*?)</strong>', r'**\1**', td, flags=re.DOTALL | re.IGNORECASE)
                clean_td = re.sub(r'<code[^>]*>(.*?)</code>', r'`\1`', clean_td, flags=re.DOTALL | re.IGNORECASE)
                clean_td = re.sub(r'<[^>]+>', ' ', clean_td)
                clean_td = re.sub(r'\s+', ' ', clean_td).strip()
                row.append(clean_td)
            rows.append(row)
    
    # If no headers were found in <th>, maybe first row is header
    if not headers and rows:
        headers = rows.pop(0)
    
    if not headers and not rows:
        return ""
    
    max_cols = max(len(headers), max((len(r) for r in rows), default=0))
    # Pad headers
    while len(headers) < max_cols:
        headers.append(f"Col {len(headers)+1}")
    
    md_lines = []
    md_lines.append("| " + " | ".join(headers) + " |")
    md_lines.append("| " + " | ".join(["---"] * max_cols) + " |")
    for r in rows:
        while len(r) < max_cols:
            r.append("")
        md_lines.append("| " + " | ".join(r) + " |")
    
    return "\n" + "\n".join(md_lines) + "\n"

def clean_figures(text):
    def replace_figure(match):
        img_src_match = re.search(r'src="([^"]+)"', match.group(0))
        img_src = img_src_match.group(1) if img_src_match else ""
        
        caption_match = re.search(r'<figcaption[^>]*>(.*?)</figcaption>', match.group(0), re.DOTALL | re.IGNORECASE)
        caption = ""
        if caption_match:
            caption = re.sub(r'<[^>]+>', '', caption_match.group(1)).strip()
        
        alt_match = re.search(r'alt="([^"]*)"', match.group(0))
        alt = alt_match.group(1).strip() if alt_match else ""
        
        title = caption or alt or "Diagram Schematic"
        if img_src:
            return f"\n\n![{title}]({img_src})\n\n"
        return ""

    return re.sub(r'<figure[^>]*>.*?</figure>', replace_figure, text, flags=re.DOTALL | re.IGNORECASE)

def clean_markdown_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # 1. Convert HTML tables to Markdown tables
    def replace_table(match):
        return html_table_to_md(match.group(0))
    
    content = re.sub(r'<table[^>]*>.*?</table>', replace_table, content, flags=re.DOTALL | re.IGNORECASE)

    # 2. Clean figure tags
    content = clean_figures(content)

    # 3. Remove duplicate headings: e.g. ## X.Y Title \n\n # X.Y Title
    # Or ## X.Y Title \n # X.Y Title
    content = re.sub(r'(##\s+([0-9]+\.[0-9]+[^\r\n]*))\r?\n+\s*#\s+\2', r'\1', content)
    # Also handle inverted if any: # X.Y Title \n ## X.Y Title
    content = re.sub(r'(#\s+([0-9]+\.[0-9]+[^\r\n]*))\r?\n+\s*##\s+\2', r'## \2', content)

    # 4. Clean duplicate adjacent lines
    lines = content.splitlines()
    cleaned_lines = []
    prev_line = None
    for line in lines:
        stripped = line.strip()
        # if identical non-empty bullet point or paragraph repeated immediately
        if stripped and stripped == prev_line and (stripped.startswith('* ') or stripped.startswith('- ') or stripped.startswith('• ')):
            continue
        cleaned_lines.append(line)
        prev_line = stripped if stripped else prev_line

    content = "\n".join(cleaned_lines)

    # 5. Fix common code quirks like 'codeint i = 0;'
    content = content.replace('codeint ', 'int ')

    # 6. Replace common raw LaTeX expressions with clean unicode symbols for mobile readability
    content = content.replace(r'\dots', '...')
    content = content.replace(r'\times', '×')
    content = content.replace(r'\Omega', 'Ω')
    content = content.replace(r'\mu', 'μ')
    content = content.replace(r'\approx', '≈')
    content = content.replace(r'\le', '≤')
    content = content.replace(r'\ge', '≥')
    content = content.replace(r'\pm', '±')
    content = content.replace(r'\infty', '∞')
    content = content.replace(r'\Delta', 'Δ')
    content = content.replace(r'\neq', '≠')
    content = content.replace(r'\pi', 'π')

    # 7. Normalize heading formatting: "### **1. Title**" -> "### 1. Title"
    def normalize_h3(match):
        prefix = match.group(1) # ###
        num = match.group(2)    # 1. or 2.
        title = match.group(3).strip('* ')
        return f"{prefix} {num} {title}"

    content = re.sub(r'^(###)\s+\*\*([0-9]+\.?)\s*(.*?)\*\*', normalize_h3, content, flags=re.MULTILINE)
    content = re.sub(r'^(###)\s+([0-9]+\.?)\s*\*\*(.*?)\*\*', normalize_h3, content, flags=re.MULTILINE)

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

    print(f"Cleaned {os.path.basename(filepath)}")

def main():
    notes_dir = 'assets/notes'
    for f in sorted(os.listdir(notes_dir)):
        if f.endswith('.md'):
            clean_markdown_file(os.path.join(notes_dir, f))

if __name__ == '__main__':
    main()
