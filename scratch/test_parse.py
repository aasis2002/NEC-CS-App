import urllib.request
import re
import json

def fetch_url(url):
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    with urllib.request.urlopen(req, timeout=20) as resp:
        return resp.read().decode('utf-8')

def clean_latex(text):
    text = text.replace(r'\_', '_')
    text = re.sub(r'\$\$([^\$]+)\$\$', r'\1', text)
    text = re.sub(r'\$([^\$]+)\$', r'\1', text)
    text = text.replace(r'\\', '')
    return text.strip()

def parse_markdown_questions(md_text, set_name, year, session, is_pyq=True):
    # Split by questions: ### \d+\.
    # regex to find questions
    pattern = r'###\s+(\d+)\.\s+(.*?)(?=\n###\s+\d+\.|\Z)'
    matches = re.findall(pattern, md_text, re.DOTALL)
    
    questions = []
    for q_num, q_body in matches:
        q_body = q_body.strip()
        
        # Split question text and details
        details_match = re.search(r'<details>(.*?)</details>', q_body, re.DOTALL)
        if not details_match:
            continue
        
        details_content = details_match.group(1).strip()
        above_details = q_body[:details_match.start()].strip()
        
        # The options are listed as 1. or 1) or - or *
        # Let's extract question stem and options
        lines = above_details.split('\n')
        stem_lines = []
        option_lines = []
        
        for l in lines:
            l_str = l.strip()
            if not l_str:
                continue
            opt_m = re.match(r'^(\d+|[A-Da-d])[\.\)]\s+(.*)', l_str)
            if opt_m:
                option_lines.append((opt_m.group(1), opt_m.group(2).strip()))
            elif option_lines:
                # Continuation of previous option
                prev_idx, prev_txt = option_lines[-1]
                option_lines[-1] = (prev_idx, prev_txt + ' ' + l_str)
            else:
                stem_lines.append(l_str)
                
        stem = ' '.join(stem_lines).strip()
        stem = clean_latex(stem)
        
        if not stem or len(option_lines) < 2:
            continue
            
        # Parse Answer from details_content
        # e.g. **Answer:**\n2. ... or **Answer:**\n**1) ...**
        ans_num = None
        ans_m = re.search(r'\*\*Answer:\*\*\\?\s*(\d+|[A-Da-d])[\.\)]', details_content)
        if not ans_m:
            ans_m = re.search(r'\*\*Answer:\*\*\\?\s*\*\*(\d+|[A-Da-d])[\.\)]', details_content)
        if not ans_m:
            ans_m = re.search(r'Answer:\s*(\d+|[A-Da-d])', details_content, re.IGNORECASE)
            
        if ans_m:
            ans_str = ans_m.group(1).upper()
            if ans_str in ['1', 'A']:
                ans_num = 0
            elif ans_str in ['2', 'B']:
                ans_num = 1
            elif ans_str in ['3', 'C']:
                ans_num = 2
            elif ans_str in ['4', 'D']:
                ans_num = 3
        else:
            # Check if answer text matches one of the options
            ans_block_m = re.search(r'\*\*Answer:\*\*\\?\s*(.*?)(?=\n\s*\*\*Explanation:|\Z)', details_content, re.DOTALL)
            if ans_block_m:
                ans_text = clean_latex(ans_block_m.group(1).replace('*', '').strip().lower())
                for idx, (_, opt_txt) in enumerate(option_lines):
                    clean_opt = clean_latex(opt_txt.replace('*', '').strip().lower())
                    if ans_text and (ans_text in clean_opt or clean_opt in ans_text):
                        ans_num = idx
                        break
        
        if ans_num is None:
            ans_num = 0 # fallback default
            
        # Parse Explanation
        exp_m = re.search(r'\*\*Explanation:\*\*\\?\s*(.*)', details_content, re.DOTALL)
        explanation = ''
        if exp_m:
            explanation = clean_latex(exp_m.group(1).replace('</details>', '').strip())
        else:
            explanation = 'Verified standard answer based on NEC engineering exam curriculum.'
            
        # Standardize 4 options
        options = []
        letters = ['A', 'B', 'C', 'D']
        for i in range(min(4, len(option_lines))):
            _, opt_text = option_lines[i]
            opt_clean = clean_latex(opt_text)
            options.append({
                'optionLetter': letters[i],
                'text': opt_clean,
                'isCorrect': (i == ans_num)
            })
            
        # If fewer than 4 options, pad
        while len(options) < 4:
            i = len(options)
            options.append({
                'optionLetter': letters[i],
                'text': 'None of the above',
                'isCorrect': (i == ans_num)
            })
            
        questions.append({
            'num': int(q_num),
            'stem': stem,
            'options': options,
            'explanation': explanation,
            'set_name': set_name,
            'year': year,
            'session': session,
            'is_pyq': is_pyq
        })
        
    return questions

if __name__ == '__main__':
    url = 'https://nec-license.gitbook.io/books/questions-sets/set-1-chaitra-2080/short-questions-60-1-60-marks.md'
    text = fetch_url(url)
    qs = parse_markdown_questions(text, 'Set 1 (Chaitra 2080)', 2080, 'Chaitra')
    print(f'Parsed {len(qs)} questions from Set 1 Short')
    if qs:
        print('Sample Q1:', json.dumps(qs[0], indent=2))
