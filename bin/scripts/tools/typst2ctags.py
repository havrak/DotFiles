#!/usr/bin/env python3
import sys
import re
import os

def vim_escape(s):
    for ch in '.^$~[]\\/':
        s = s.replace(ch, '\\' + ch)
    return s

def main():
    if len(sys.argv) < 2:
        sys.exit(1)

    filepath = os.path.abspath(sys.argv[-1])
    try:
        with open(filepath, 'r') as f:
            lines = f.readlines()
    except IOError:
        sys.exit(1)

    SRO = "»"
    KIND_FOR_LEVEL  = {1: 'c', 2: 's', 3: 'u', 4: 'b'}
    SCOPE_FOR_LEVEL = {1: 'chapter', 2: 'section', 3: 'subsection', 4: 'subsubsection'}

    stack = []
    heading_re = re.compile(r'^(=+)\s+(.*)')

    for lineno, line in enumerate(lines, 1):
        m = heading_re.match(line)
        if not m:
            continue

        level = len(m.group(1))
        name = m.group(2).strip()
        if level > 4:
            continue

        while stack and stack[-1][0] >= level:
            stack.pop()

        kind = KIND_FOR_LEVEL[level]

        if stack:
            parent_level, parent_name, parent_path = stack[-1]
            parent_scope = SCOPE_FOR_LEVEL[parent_level]
            scope_field = f"\t{parent_scope}:{parent_path}"
            full_path = parent_path + SRO + name
        else:
            scope_field = ""
            full_path = name

        prefix = '=' * level
        pattern = f"/^{prefix} {vim_escape(name)}$/"

        # address;"  \tkind  [scope]  \tline:N
        print(f"{name}\t{filepath}\t{pattern};\"\t{kind}{scope_field}\tline:{lineno}")

        stack.append((level, name, full_path))

if __name__ == "__main__":
    main()
