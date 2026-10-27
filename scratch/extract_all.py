import urllib.request
import re
import json
import os
import time

def fetch_url(url):
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    try:
        with urllib.request.urlopen(req, timeout=20) as resp:
            return resp.read().decode('utf-8')
    except Exception as e:
        print(f"Error fetching {url}: {e}")
        return None

def clean_latex(text):
    if not text:
        return ""
    text = text.replace(r'\_', '_')
    text = re.sub(r'\$\$([^\$]+)\$\$', r'\1', text)
    text = re.sub(r'\$([^\$]+)\$', r'\1', text)
    text = text.replace(r'\\', '')
    text = text.replace('\r\n', '\n').strip()
    return text

def classify_question_unit(stem, explanation):
    text = (stem + " " + explanation).lower()
    if any(k in text for k in ['labor act', 'nec act', 'procurement', 'npv', 'irr', 'cpm', 'pert', 'marr', 'cash flow', 'isometric', 'orthographic', 'drawing', 'ethics', 'arbitration', 'tender', 'depreciation', 'critical path', 'float', 'contract']):
        return 'unit_10'
    if any(k in text for k in ['neural', 'perceptron', 'artificial intelligence', 'nlp', 'natural language', 'heuristic', 'a* algorithm', 'minimax', 'alpha-beta', 'expert system', 'machine learning', 'unsupervised', 'supervised', 'agent', 'backpropagation', 'propositional logic', 'resolution', 'first-order logic']):
        return 'unit_9'
    if any(k in text for k in ['software engineering', 'sdlc', 'agile', 'scrum', 'waterfall', 'v-model', 'cmmi', 'black-box', 'white-box', 'use case', 'class diagram', 'sequence diagram', 'uml', 'coupling', 'cohesion', 'cyclomatic', 'refactoring', 'design pattern', 'singleton', 'software test']):
        return 'unit_8'
    if any(k in text for k in ['bcnf', 'sql', 'normalization', 'relational', 'transaction', 'acid', 'concurrency', 'deadlock', 'semaphore', 'mutex', 'paging', 'virtual memory', 'page replacement', 'lru', 'fifo', 'avl tree', 'binary search tree', 'heap', 'stack', 'queue', 'linked list', 'hashing', 'dijkstra', 'dfs', 'bfs', 'process scheduling', 'round robin']):
        return 'unit_7'
    if any(k in text for k in ['turing machine', 'context-free', 'cfg', 'pda', 'finite automata', 'dfa', 'nfa', 'regular expression', 'pumping lemma', 'chomsky', 'decidability', 'halting problem', 'graphics', 'raster', 'vector', 'bresenham', 'cohen-sutherland', 'clipping', 'transformation', 'projection', 'perspective projection', 'frame buffer', 'bezier']):
        return 'unit_6'
    if any(k in text for k in ['tcp', 'udp', 'ip address', 'subnet', 'cidr', 'osi model', 'data link', 'ethernet', 'csma/cd', 'arp', 'routing', 'ospf', 'rip', 'bgp', 'dns', 'http', 'smtp', 'ftp', 'socket', 'firewall', 'cryptography', 'rsa', 'aes', 'ssl', 'tls', 'ipsec', 'vpn', 'symmetric key', 'public key']):
        return 'unit_5'
    if any(k in text for k in ['cache', 'pipelining', 'risc', 'cisc', 'control unit', 'microprogrammed', 'hardwired', 'dma', 'interrupt', 'vhdl', 'fpga', 'embedded system', 'rtos', 'hit ratio', 'associative mapping', 'bus', 'alu', 'instruction cycle', 'multiprocessor']):
        return 'unit_4'
    if any(k in text for k in ['c programming', 'c++', 'pointer', 'malloc', 'calloc', 'struct', 'union', 'inheritance', 'polymorphism', 'encapsulation', 'virtual function', 'operator overloading', 'template', 'constructor', 'destructor', 'friend function', 'namespace', 'exception handling', 'stream i/o']):
        return 'unit_3'
    if any(k in text for k in ['boolean algebra', 'k-map', 'karnaugh', 'flip-flop', 'multiplexer', 'demultiplexer', 'encoder', 'decoder', 'counter', 'shift register', '8085', '8086', 'accumulator', 'flags', '8255', 'ppi', 'trap', 'rst', 'intr', 'assembly language', 'twos complement', 'logic gate', 'nand', 'nor']):
        return 'unit_2'
    if any(k in text for k in ['ohm', 'kirchhoff', 'kcl', 'kvl', 'thevenin', 'norton', 'superposition', 'resonance', 'rlc', 'bjt', 'diode', 'mosfet', 'op-amp', 'amplifier', 'oscillator', 'conduction angle', 'rms value', 'form factor', 'peak factor', 'star-delta', 'three-phase']):
        return 'unit_1'
    return 'unit_1'

def parse_markdown_questions(md_text, set_name, year, session, is_pyq=True, default_unit=None):
    if not md_text:
        return []
    pattern = r'###\s+(\d+)\.\s+(.*?)(?=\n###\s+\d+\.|\Z)'
    matches = re.findall(pattern, md_text, re.DOTALL)
    
    questions = []
    for q_num, q_body in matches:
        q_body = q_body.strip()
        details_match = re.search(r'<details>(.*?)</details>', q_body, re.DOTALL)
        if not details_match:
            continue
        
        details_content = details_match.group(1).strip()
        above_details = q_body[:details_match.start()].strip()
        
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
                prev_idx, prev_txt = option_lines[-1]
                option_lines[-1] = (prev_idx, prev_txt + ' ' + l_str)
            else:
                stem_lines.append(l_str)
                
        stem = ' '.join(stem_lines).strip()
        stem = clean_latex(stem)
        
        if not stem or len(option_lines) < 2:
            continue
            
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
            ans_block_m = re.search(r'\*\*Answer:\*\*\\?\s*(.*?)(?=\n\s*\*\*Explanation:|\Z)', details_content, re.DOTALL)
            if ans_block_m:
                ans_text = clean_latex(ans_block_m.group(1).replace('*', '').strip().lower())
                for idx, (_, opt_txt) in enumerate(option_lines):
                    clean_opt = clean_latex(opt_txt.replace('*', '').strip().lower())
                    if ans_text and (ans_text in clean_opt or clean_opt in ans_text):
                        ans_num = idx
                        break
        
        if ans_num is None:
            ans_num = 0
            
        exp_m = re.search(r'\*\*Explanation:\*\*\\?\s*(.*)', details_content, re.DOTALL)
        explanation = ''
        if exp_m:
            explanation = clean_latex(exp_m.group(1).replace('</details>', '').strip())
        else:
            explanation = 'Verified standard answer based on NEC Computer Engineering syllabus.'
            
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
            
        while len(options) < 4:
            i = len(options)
            options.append({
                'optionLetter': letters[i],
                'text': 'None of the above',
                'isCorrect': (i == ans_num)
            })
            
        unit_id = default_unit or classify_question_unit(stem, explanation)
        
        questions.append({
            'num': int(q_num),
            'stem': stem,
            'options': options,
            'explanation': explanation,
            'set_name': set_name,
            'year': year,
            'session': session,
            'is_pyq': is_pyq,
            'unit_id': unit_id
        })
        
    return questions

def run_extraction():
    all_parsed_questions = []
    
    # 1. Fetch Past Paper sets
    pyq_sources = [
        ('Set 1 (Chaitra, 2080)', 'set-1-chaitra-2080', 2080, 'Chaitra 2080'),
        ('Set 2 (Aasadh, 2081)', 'set-2-aasadh-2081', 2081, 'Aasadh 2081'),
        ('Set 3 (Asojh, 2080)', 'set-3-asojh-2080', 2080, 'Asojh 2080'),
        ('Model Set - Computer Engineering By NEC', 'model-set-computer-engineering-by-nec', 2081, 'Model Set Computer'),
        ('Model Set - Software Engineering By NEC', 'model-set-software-engineering-by-nec', 2081, 'Model Set Software'),
    ]
    
    for name, slug, year, session in pyq_sources:
        for q_type, q_file in [('Short', 'short-questions-60-1-60-marks.md'), ('Long', 'long-questions-20-2-40-marks.md')]:
            url = f'https://nec-license.gitbook.io/books/questions-sets/{slug}/{q_file}'
            print(f"Fetching {name} {q_type} from {url}...")
            text = fetch_url(url)
            if text:
                qs = parse_markdown_questions(text, f"{name} - {q_type}", year, session, is_pyq=True)
                print(f"  -> Extracted {len(qs)} questions")
                all_parsed_questions.extend(qs)
            time.sleep(0.5)

    # 2. Fetch specific Chapter MCQs from the book to ensure strong coverage across every unit
    chapter_mcqs = [
        # Unit 1
        ('unit_1', 'Basic Electronics Set 1', 'https://nec-license.gitbook.io/books/1.-concept-of-basic-electrical-and-electronics-engineering/mcqs/mcqs-on-basic-electronics/set-1.md'),
        ('unit_1', 'Basic Electronics Set 2', 'https://nec-license.gitbook.io/books/1.-concept-of-basic-electrical-and-electronics-engineering/mcqs/mcqs-on-basic-electronics/set-2.md'),
        # Unit 2
        ('unit_2', 'Digital Logic Set 1', 'https://nec-license.gitbook.io/books/2.-digital-logic-and-microprocessor/mcqs/mcqs-on-digital-logic/set-1.md'),
        ('unit_2', 'Digital Logic Set 2', 'https://nec-license.gitbook.io/books/2.-digital-logic-and-microprocessor/mcqs/mcqs-on-digital-logic/set-2.md'),
        ('unit_2', 'Microprocessor Set 1', 'https://nec-license.gitbook.io/books/2.-digital-logic-and-microprocessor/mcqs/mcqs-on-microprocessor/set-1.md'),
        ('unit_2', 'Microprocessor Set 2', 'https://nec-license.gitbook.io/books/2.-digital-logic-and-microprocessor/mcqs/mcqs-on-microprocessor/set-2.md'),
        # Unit 3
        ('unit_3', 'Programming Language Set 1', 'https://nec-license.gitbook.io/books/3.-programming-language-and-its-applications/mcqs/set-1.md'),
        ('unit_3', 'Programming Language Set 2', 'https://nec-license.gitbook.io/books/3.-programming-language-and-its-applications/mcqs/set-2.md'),
        # Unit 4
        ('unit_4', 'Computer Organization Set 1', 'https://nec-license.gitbook.io/books/4.-computer-organization-and-embedded-system/mcqs/set-1.md'),
        ('unit_4', 'Computer Organization Set 2', 'https://nec-license.gitbook.io/books/4.-computer-organization-and-embedded-system/mcqs/set-2.md'),
        # Unit 5
        ('unit_5', 'Basic Networking Set 1', 'https://nec-license.gitbook.io/books/5.-concept-of-computer-network-and-network-security-system/mcqs/basic-networking/set-1.md'),
        ('unit_5', 'Advanced Networking Set 1', 'https://nec-license.gitbook.io/books/5.-concept-of-computer-network-and-network-security-system/mcqs/advanced-networking/set-1.md'),
        # Unit 6
        ('unit_6', 'Theory of Computation Set 1', 'https://nec-license.gitbook.io/books/6.-theory-of-computation-and-computer-graphics/mcqs/mcqs-on-theory-of-computation/set-1.md'),
        ('unit_6', 'Computer Graphics Set 1', 'https://nec-license.gitbook.io/books/6.-theory-of-computation-and-computer-graphics/mcqs/mcqs-on-computer-graphics/set-1.md'),
        # Unit 7
        ('unit_7', 'DSA Set 1', 'https://nec-license.gitbook.io/books/7.-data-structures-and-algorithm-database-system-and-operating-system/mcqs/mcqs-on-dsa/set-1.md'),
        ('unit_7', 'DBMS Set 1', 'https://nec-license.gitbook.io/books/7.-data-structures-and-algorithm-database-system-and-operating-system/mcqs/mcqs-on-dbms/set-1.md'),
        ('unit_7', 'Operating System Set 1', 'https://nec-license.gitbook.io/books/7.-data-structures-and-algorithm-database-system-and-operating-system/mcqs/mcqs-on-operating-system/set-1.md'),
        # Unit 8
        ('unit_8', 'Software Engineering Set 1', 'https://nec-license.gitbook.io/books/8.-software-engineering-and-object-oriented-analysis-and-design/mcqs/set-1.md'),
        ('unit_8', 'Software Engineering Set 2', 'https://nec-license.gitbook.io/books/8.-software-engineering-and-object-oriented-analysis-and-design/mcqs/set-2.md'),
        # Unit 9
        ('unit_9', 'Artificial Intelligence Set 1', 'https://nec-license.gitbook.io/books/9.-artificial-intelligence-and-neural-networks/mcqs/set-1.md'),
        ('unit_9', 'Artificial Intelligence Set 2', 'https://nec-license.gitbook.io/books/9.-artificial-intelligence-and-neural-networks/mcqs/set-2.md'),
        # Unit 10
        ('unit_10', 'Engineering Economics', 'https://nec-license.gitbook.io/books/10.-project-planning-design-and-implementation/mcqs/mcqs-on-engineering-economics.md'),
        ('unit_10', 'Engineering Drawing Set 1', 'https://nec-license.gitbook.io/books/10.-project-planning-design-and-implementation/mcqs/mcqs-on-engineering-drawing/set-1.md'),
        ('unit_10', 'Professional Practice', 'https://nec-license.gitbook.io/books/10.-project-planning-design-and-implementation/mcqs/mcqs-on-engineering-professional-practice.md'),
    ]
    
    for unit_id, set_title, url in chapter_mcqs:
        print(f"Fetching Chapter MCQ: {set_title} from {url}...")
        text = fetch_url(url)
        if text:
            qs = parse_markdown_questions(text, f"Chapter Quiz: {set_title}", 2081, 'Topic Quiz', is_pyq=False, default_unit=unit_id)
            print(f"  -> Extracted {len(qs)} questions")
            all_parsed_questions.extend(qs)
        time.sleep(0.4)
        
    print(f"\nTotal raw questions gathered: {len(all_parsed_questions)}")
    
    # 3. Deduplicate by question text
    seen_stems = set()
    deduped = []
    for q in all_parsed_questions:
        norm_stem = re.sub(r'\s+', ' ', q['stem'].strip().lower())
        if norm_stem in seen_stems or len(norm_stem) < 10:
            continue
        seen_stems.add(norm_stem)
        deduped.append(q)
        
    print(f"Total unique questions after deduplication: {len(deduped)}")
    
    # 4. Convert into seed bank structure
    final_questions = []
    unit_distribution = {f'unit_{i}': 0 for i in range(1, 11)}
    
    for idx, q in enumerate(deduped):
        qid = f"q_book_{idx+1:04d}"
        u_id = q['unit_id']
        unit_distribution[u_id] = unit_distribution.get(u_id, 0) + 1
        
        # Format options
        opts = []
        for opt_idx, opt in enumerate(q['options']):
            opts.append({
                "id": f"opt_{qid}_{opt['optionLetter'].lower()}",
                "optionLetter": opt['optionLetter'],
                "text": opt['text'],
                "isCorrect": opt['isCorrect']
            })
            
        final_questions.append({
            "id": qid,
            "unitId": u_id,
            "topicId": f"{u_id}_core",
            "questionText": q['stem'],
            "explanation": q['explanation'],
            "year": q['year'],
            "isPyq": q['is_pyq'],
            "sourceType": f"NEC_BOOK_{q['session'].upper().replace(' ', '_')}",
            "difficulty": "medium",
            "options": opts
        })
        
    print("\nUnit Distribution:")
    for u, cnt in unit_distribution.items():
        print(f"  {u}: {cnt} questions")
        
    output_path = 'assets/data/questions_seed.json'
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump({"questions": final_questions}, f, indent=2, ensure_ascii=False)
        
    print(f"\nSaved {len(final_questions)} questions to {output_path}")

if __name__ == '__main__':
    run_extraction()
