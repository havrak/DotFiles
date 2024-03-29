#!/bin/sed -f
s/\$\\Rightarrow\$/->/g
s/\$\\Reftarrow\$/->/g
s/\\uv{\([^}]*\)}/"\1"/g
s/\\textbf{\([^}]*\)}/*\1*/g
s/\\textit{\([^}]*\)}/_\1_/g
s/\\subsubsection.\([^}]*\).*/==== \1 ====/g
s/\\subsection.\([^}]*\).*/=== \1 ===/g
s/\\section.\([^}]*\).*/== \1 ==/g
s/\\chapter.\([^}]*\).*/= \1 =/g
s/\\item.\(.*\)$/\1/g
s/\\\%/\%/g
s/^<\#><\#><\#>\(.*\)$/\t\t\t\1/g
s/^<\#><\#>\(.*\)$/\t\t\1/g
s/^<\#>\(.*\)$/\t\1/g

