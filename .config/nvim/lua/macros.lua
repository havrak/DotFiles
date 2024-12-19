--- LaTeX
local macros_group = vim.api.nvim_create_augroup('Macros group', { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = macros_group,
	pattern = "tex",
	callback = function()
		vim.keymap.set('i', ',,', '\\')
		vim.keymap.set('i', ',.', '$$<Esc>i')

		-- LaTeX Page layout
		vim.keymap.set('i', ',min', '\\begin{minipage}[t]{.45\\textwidth}<Enter><Enter>\\end{minipage}<Esc>ki') -- minipage
		vim.keymap.set('i', ',col', '\\begin{multicols}{2}\\raggedcolumns<Enter><Enter>\\columnbreak<Enter><Enter>\\end{multicols}<Esc>3ki') -- two column layout
		vim.keymap.set('i', ',cen', '\\begin{center}<Enter><Enter>\\end{center}<Esc>ki') -- center align

		-- LaTeX Figures
		vim.keymap.set('i', ',fig', '\\begin{figure}[h!]<Enter>\\centering<Enter><Enter>\\caption[<++>]{<++>}<Enter>\\label{fig:<++>}<Enter>\\end{figure}<Esc>3k$i') -- figure (includes caption and label)
		vim.keymap.set('i', ',ltab', '\\begin{longtable}{| }<Enter>\\hline<Enter><++><Enter>\\hline<Enter><++><Enter>\\hline<Enter>\\end{longtable}<Esc>6k$i') -- table without any content
		vim.keymap.set('i', ',ftab', '\\begin{table}[h!]<Enter>\\centering<Enter>\\caption[]{<++>}<Enter><++><Enter>\\label{tab:<++>}<Enter>\\end{table}<Esc>3k$6hi') -- figure (includes caption and label)
		vim.keymap.set('i', ',tab', '\\begin{tabular}{| }<Enter>\\hline<Enter><++><Enter>\\hline<Enter><++><Enter>\\hline<Enter>\\end{tabular}<Esc>6k$i') -- table without any content
		vim.keymap.set('i', ',ctab', 'm{cm} | <++><Esc>9hi') -- table without any content
		vim.keymap.set('i', ',cod', '\\begin{minted}[mathescape,escapeinside=@@,linenos,numbersep=5pt,frame=lines,breaklines,tabsize=3,framesep=2mm]{}<Enter><++><Enter>\\end{minted}<Esc>2k$i') -- code block
		vim.keymap.set('i', ',img', '\\includegraphics[width=0.7\\textwidth]{}<Esc>i') -- includegraphics

		-- LaTeX Text Formatting
		vim.keymap.set('i', ',em', '\\emph{}<Esc>T{i') -- emphasis
		vim.keymap.set('i', ',bf', '\\textbf{}<Esc>T{i') -- bold
		vim.keymap.set('i', ',it', '\\textit{}<Esc>T{i') -- italic
		vim.keymap.set('i', ',nt', '\\textnormal{}<Esc>ha') -- normal text
		vim.keymap.set('i', ',uv', '\\uv{}<Esc>T{i') -- quotation marks
		vim.keymap.set('i', ',ud', '\\underline{}<Esc>T{i') -- underline

		-- LaTeX Sections
		vim.keymap.set('i', ',chap', '\\chapter{}<Enter><Enter><++><Esc>2kf}i') -- chapter
		vim.keymap.set('i', ',sec', '\\section{}<Enter><Enter><++><Esc>2kf}i') -- section
		vim.keymap.set('i', ',ssec', '\\subsection{}<Enter><Enter><++><Esc>2kf}i') -- subsection
		vim.keymap.set('i', ',sssec', '\\subsubsection{}<Enter><Enter><++><Esc>2kf}i') -- subsubsection

		-- LaTeX Citations, Footnotes, and References
		vim.keymap.set('i', ',fn', '\\footnote{}<Esc>T{i') -- footnote
		vim.keymap.set('i', ',fm', '\\footnotemark') -- footnotemark
		vim.keymap.set('i', ',ft', '\\footnotetext{}<Esc>T{i') -- footnotetext for footnotemark
		vim.keymap.set('i', ',ct', '\\textcite{}<Esc>T{i') -- textcite
		vim.keymap.set('i', ',ci', '\\fullbibentry{}<Esc>T{i') -- fullbibentry
		vim.keymap.set('i', ',cf', '\\footnote{Ibid.<space>\\cite{<++>}:<space><++>}') -- footnote with citation
		vim.keymap.set('i', ',r', '\\ref{}<Esc>T{i') -- reference to label
		vim.keymap.set('i', ',er', '\\eqref{}<Esc>T{i') -- reference to equation

		-- LaTeX Lists
		vim.keymap.set('i', ',ul', '\\begin{itemize}<Enter><Enter>\\end{itemize}<Esc>kA\\item<Space>') -- unordered list
		vim.keymap.set('i', ',ol', '\\begin{enumerate}<Enter><Enter>\\end{enumerate}<Esc>kA\\item<Space>') -- ordered list
		vim.keymap.set('i', ',ll', '\\begin{enumerate}[label=\\alph*)]<Enter><Enter>\\end{enumerate}<Esc>kA\\item<Space>') -- letter list
		vim.keymap.set('i', ',li', '<ESC>o\\item<Space>') -- list item

		-- LaTeX Theorems
		vim.keymap.set('i', ',tl', '\\begin{lemma}[]<Enter><++><Enter>\\end{lemma}<Esc>2k$i') -- lemma
		vim.keymap.set('i', ',tv', '\\begin{veta}[]<Enter><++><Enter>\\end{veta}<Esc>2k$i') -- theorem
		vim.keymap.set('i', ',te', '\\begin{definice}[]<enter><++><enter>\\end{definice}<Esc>2k$i') -- definition
		vim.keymap.set('i', ',tt', '\\begin{tvrz}<Enter><Enter>\\end{tvrz}<Esc>ki') -- statement
		vim.keymap.set('i', ',td', '\\begin{dusl}<enter><enter>\\end{dusl}<esc>ki') -- consequence
		vim.keymap.set('i', ',tp', '\\begin{dukaz}<enter><enter>\\end{dukaz}<Esc>ki') -- proof

		-- LaTeX Math Mode
		vim.keymap.set('i', ',ra', '$\\Rightarrow$<space>')
		vim.keymap.set('i', ',la', '$\\Leftarrow$<space>')
		vim.keymap.set('i', '.pmat', '\\begin{pmatrix}<Enter>\\\\<Enter>\\end{pmatrix}<Esc>khhi') -- matrix with parentheses
		vim.keymap.set('i', '.emat', '\\begin{matrix}<Enter>\\\\<Enter>\\end{matrix}<Esc>khhi') -- matrix
		vim.keymap.set('i', '.vmat', '\\begin{vmatrix}<Enter>\\\\<Enter>\\end{vmatrix}<Esc>khhi') -- matrix with vertical lines
		vim.keymap.set('i', '.lim', '\\lim_{ \\rightarrow <++>}<Space><++><Space><Esc>23hi') -- limit
		vim.keymap.set('i', '.lie', '\\frac{d }{d <++>}<Space><++><Esc>13hi') -- liebnitz style for derivative
		vim.keymap.set('i', '.com', '\\frac{D }{D <++>}<Space><++><Esc>13hi') -- liebnitz style for derivative
		vim.keymap.set('i', '.par', '\\frac{\\partial }{\\partial <++>}<Space><++><Esc>20hi') -- partial derivative
		vim.keymap.set('i', '.sum', '\\sum_{}^{<++>}<Space><++><Esc>12hi') -- sum
		vim.keymap.set('i', '.n', '\\int_{}^{<++>}<Space><++><Space>d<++><Esc>18hi') -- integral
		vim.keymap.set('i', '.ve', '\\vec{}<Esc>ha') -- vector
		vim.keymap.set('i', '.t', '\\mathrm{}<Esc>ha') -- text in math mode without italics
		vim.keymap.set('i', '.ca', '\\mathcal{}<Esc>ha') -- text with accents
		vim.keymap.set('i', '.fr', '\\frac{}{<++>}<Space><++><Esc>12ha') -- fraction
		vim.keymap.set('i', '.i', '\\infty<Space>') -- infinity
		vim.keymap.set('i', '.d', '\\cdot<Space>') -- dot
		vim.keymap.set('i', '.j', '\\left') -- left
		vim.keymap.set('i', '.k', '\\right') -- right
		vim.keymap.set('i', '.cf', '\\mathscr{F}[](<++>)<Space><++><Esc>11hi') -- Fourier transform
		vim.keymap.set('i', '.cl', '\\mathscr{L}[](<++>)<Space><++><Esc>11hi') -- Laplace transform
		vim.keymap.set('i', '.cz', '\\mathscr{Z}[](<++>)<Space><++><Esc>11hi') -- Z transform
		vim.keymap.set('i', '.cF', '\\mathscr{F}^{-1}[](<++>)<Space><++><Esc>11hi') -- Fourier transform
		vim.keymap.set('i', '.cL', '\\mathscr{L}^{-1}[](<++>)<Space><++><Esc>11hi') -- Laplace transform
		vim.keymap.set('i', '.cZ', '\\mathscr{Z}^{-1}[](<++>)<Space><++><Esc>11hi') -- Z transform
		vim.keymap.set('i', '.ch', '\\mathbbm{1}') -- Heaviside function
		vim.keymap.set('i', '.arr', '\\left\\{\\begin{array}{} <++> \\end{array} \\right.<Esc>25hi') -- to display multiple possibilities with given conditions
		vim.keymap.set('i', '.eq', '\\begin{equation}<Enter><Enter>\\label{eq:<++>}<Enter>\\end{equation}<Esc>2k$i') -- equation

		-- LaTeX Beamer specific
		vim.keymap.set('i', ',frames', '\\begin{frame}[fragile]<Enter>\\frametitle{}<Enter>\\begin{itemize}<Enter>\\item <++><Enter>\\end{itemize}<Enter>\\end{frame}<Enter><Enter><++><Esc>6kf}i') -- frame
		vim.keymap.set('i', ',framed', '\\begin{frame}[fragile]<Enter>\\begin{figure}[!htb]<Enter>\\begin{minipage}{0.48\\textwidth}<Enter>\\centering<Enter>\\includegraphics[height=.8\\linewidth]{}<Enter>\\caption{<++>\\footnotemark}<Enter>\\end{minipage}\\hfill<Enter>\\begin{minipage}{0.48\\textwidth}<Enter>\\centering<Enter>\\includegraphics[height=.8\\linewidth]{<++>}<Enter>\\caption{<++>\\footnotemark}<Enter>\\end{minipage}<Enter>\\end{figure}<Enter>\\footnotetext[]{Obrázek z URL: \\url{<++>}}<Enter>\\footnotetext[]{Obrázek z URL: \\url{<++>}}<Enter>\\end{frame}<Esc>11k$i') -- frame with two pictures with captions and footnotes that include source URLs

	end
})
