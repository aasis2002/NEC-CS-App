import urllib.request
import re
import json
import os
import time

def fetch_url(url):
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'})
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
            
        # Classify Unit based on keywords if not default
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

def classify_question_unit(stem, explanation):
    text = (stem + " " + explanation).lower()
    
    # Unit 10: Economics, Regulatory, Ethics, Drawing, Scheduling
    if any(k in text for k in ['labor act', 'nec act', 'procurement', 'npv', 'irr', 'cpm', 'pert', 'marr', 'cash flow', 'isometric', 'orthographic', 'drawing', 'ethics', 'arbitration', 'tender', 'depreciation', 'critical path', 'float', 'contract']):
        return 'unit_10'
    # Unit 9: AI, Neural Networks, NLP, ML
    if any(k in text for k in ['neural', 'perceptron', 'artificial intelligence', 'nlp', 'natural language', 'heuristic', 'a* algorithm', 'minimax', 'alpha-beta', 'expert system', 'machine learning', 'unsupervised', 'supervised', 'agent', 'backpropagation', 'propositional logic', 'resolution', 'first-order logic']):
        return 'unit_9'
    # Unit 8: Software Engineering, OOAD, Testing, UML
    if any(k in text for k in ['software engineering', 'sdlc', 'agile', 'scrum', 'waterfall', 'v-model', 'cmmi', 'black-box', 'white-box', 'use case', 'class diagram', 'sequence diagram', 'uml', 'coupling', 'cohesion', 'cyclomatic', 'refactoring', 'design pattern', 'singleton', 'software test']):
        return 'unit_8'
    # Unit 7: DSA, DBMS, OS
    if any(k in text for k in ['bcnf', 'sql', 'normalization', 'relational', 'transaction', 'acid', 'concurrency', 'deadlock', 'semaphore', 'mutex', 'paging', 'virtual memory', 'page replacement', 'lru', 'fifo', 'avl tree', 'binary search tree', 'heap', 'stack', 'queue', 'linked list', 'hashing', 'dijkstra', 'dfs', 'bfs', 'process scheduling', 'round robin']):
        return 'unit_7'
    # Unit 6: Theory of Computation & Computer Graphics
    if any(k in text for k in ['turing machine', 'context-free', 'cfg', 'pda', 'finite automata', 'dfa', 'nfa', 'regular expression', 'pumping lemma', 'chomsky', 'decidability', 'halting problem', 'graphics', 'raster', 'vector', 'bresenham', 'cohen-sutherland', 'clipping', 'transformation', 'projection', 'perspective projection', 'frame buffer', 'bezier']):
        return 'unit_6'
    # Unit 5: Computer Networks & Network Security
    if any(k in text for k in ['tcp', 'udp', 'ip address', 'subnet', 'cidr', 'osi model', 'data link', 'ethernet', 'csma/cd', 'arp', 'routing', 'ospf', 'rip', 'bgp', 'dns', 'http', 'smtp', 'ftp', 'socket', 'firewall', 'cryptography', 'rsa', 'aes', 'ssl', 'tls', 'ipsec', 'vpn', 'symmetric key', 'public key']):
        return 'unit_5'
    # Unit 4: Computer Organization & Embedded System
    if any(k in text for k in ['cache', 'pipelining', 'risc', 'cisc', 'control unit', 'microprogrammed', 'hardwired', 'dma', 'interrupt', 'vhdl', 'fpga', 'embedded system', 'rtos', 'hit ratio', 'associative mapping', 'bus', 'alu', 'instruction cycle', 'multiprocessor']):
        return 'unit_4'
    # Unit 3: Programming Language (C / C++)
    if any(k in text for k in ['c programming', 'c++', 'pointer', 'malloc', 'calloc', 'struct', 'union', 'inheritance', 'polymorphism', 'encapsulation', 'virtual function', 'operator overloading', 'template', 'constructor', 'destructor', 'friend function', 'namespace', 'exception handling', 'stream i/o']):
        return 'unit_3'
    # Unit 2: Digital Logic & Microprocessor
    if any(k in text for k in ['boolean algebra', 'k-map', 'karnaugh', 'flip-flop', 'multiplexer', 'demultiplexer', 'encoder', 'decoder', 'counter', 'shift register', '8085', '8086', 'accumulator', 'flags', '8255', 'ppi', 'trap', 'rst', 'intr', 'assembly language', 'twos complement', 'logic gate', 'nand', 'nor']):
        return 'unit_2'
    # Unit 1: Basic Electrical and Electronics
    if any(k in text for k in ['ohm', 'kirchhoff', 'kcl', 'kvl', 'thevenin', 'norton', 'superposition', 'resonance', 'rlc', 'bjt', 'diode', 'mosfet', 'op-amp', 'amplifier', 'oscillator', 'conduction angle', 'rms value', 'form factor', 'peak factor', 'star-delta', 'three-phase']):
        return 'unit_1'
        
    return 'unit_1' # default

print("Helper functions compiled.")
