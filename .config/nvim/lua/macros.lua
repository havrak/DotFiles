--- LaTeX
local macros_group = vim.api.nvim_create_augroup('Macros group', { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = macros_group,
	pattern = "tex",
	callback = function()
		vim.keymap.set('i', ',frames', '\\begin{frame}[fragile]<Enter>\\frametitle{}<Enter>\\begin{itemize}<Enter>\\item <++><Enter>\\end{itemize}<Enter>\\end{frame}<Enter><Enter><++><Esc>6kf}i')
		vim.keymap.set('i', ',framei', '\\begin{frame}[fragile]<Enter>\\begin{figure}[!htb]<Enter>\\begin{minipage}{0.48\\textwidth}<Enter>\\centering<Enter>\\includegraphics[height=.8\\linewidth]{}<Enter>\\caption{<++>\\footnotemark}<Enter>\\end{minipage}\\hfill<Enter>\\begin{minipage}{0.48\\textwidth}<Enter>\\centering<Enter>\\includegraphics[height=.8\\linewidth]{<++>}<Enter>\\caption{<++>\\footnotemark}<Enter>\\end{minipage}<Enter>\\end{figure}<Enter>\\footnotetext[]{Obrázek z URL: \\url{<++>}}<Enter>\\footnotetext[]{Obrázek z URL: \\url{<++>}}<Enter>\\end{frame}<Esc>11k$i')
		vim.keymap.set('i', ',framed', '\\begin{frame}[fragile]<Enter>\\begin{minipage}{0.48\\textwidth}<Enter><Enter>\\end{minipage}\\hfill<Enter>\\begin{minipage}{0.48\\textwidth}<Enter><++><Enter>\\end{minipage}<Enter>\\end{frame}<Esc>5k$i')

		vim.keymap.set('i', ',fig', '\\begin{figure}[h]<Enter>\\centering<Enter><Enter>\\caption[]{}<Enter>\\label{fig:}<Enter>\\end{figure}<Esc>3k$i')
		vim.keymap.set('i', ',dfig', '\\begin{figure}[htb]<Enter>\\begin{minipage}[t]{.45\\textwidth}<Enter>\\centering<Enter><Enter>\\caption[<++>]{<++>}<Enter>\\end{minipage}<Enter>\\hfill<Enter>\\begin{minipage}[t]{.45\\textwidth}<Enter>\\centering<Enter><++><Enter>\\caption[<++>]{<++>}<Enter>\\end{minipage}<Enter>\\end{figure}<Esc>9ki')
		vim.keymap.set('i', ',min', '\\begin{minipage}[t]{.45\\textwidth}<Enter><Enter>\\end{minipage}<Esc>ki')

		vim.keymap.set('i', ',ctab', '\\begin{center}\\begin{longtable}{\\| m{4cm} \\| m{4cm} \\| m{4cm} \\| }<Enter>\\hline<Enter><Enter>\\hline<Enter><++><Enter>\\hline<Enter>\\end{longtable}\\begin{center}<Esc>5ki')
		vim.keymap.set('i', ',ckod', '\\begin{center}\\begin{minted}[mathescape,escapeinside=@@,linenos,numbersep=5pt,frame=lines,breaklines,tabsize=3,framesep=2mm]{}<Enter><Enter>\\end{minted}\\begin{center}<Esc>3k$i')
		vim.keymap.set('i', ',cimg', '\\begin{center}\\includegraphics[width=0.8\\textwidth]{}\\end{center}<Esc>ki')
		vim.keymap.set('i', ',tab', '\\begin{longtable}{\\| m{4cm} \\| m{4cm} \\| m{4cm} \\| }<Enter>\\hline<Enter><Enter>\\hline<Enter><++><Enter>\\hline<Enter>\\end{longtable}<Esc>4ki')
		vim.keymap.set('i', ',kod', '\\begin{minted}[mathescape,escapeinside=@@,linenos,numbersep=5pt,frame=lines,breaklines,tabsize=3,framesep=2mm]{}<Enter><Enter>\\end{minted}<Esc>2k$i')
		vim.keymap.set('i', ',img', '\\includegraphics[width=0.8\\textwidth]{}<Esc>i')

		vim.keymap.set('i', ',ra', '$\\Rightarrow$<space>')
		vim.keymap.set('i', ',la', '$\\Leftarrow$<space>')
		vim.keymap.set('i', ',em', '\\emph{}<Esc>T{i')
		vim.keymap.set('i', ',bf', '\\textbf{}<Esc>T{i')
		vim.keymap.set('i', ',ud', '\\underline{}<Esc>T{i')
		vim.keymap.set('i', ',uv', '\\uv{}<Esc>T{i')
		vim.keymap.set('i', ',fn', '\\footnote{}<Esc>T{i')
		vim.keymap.set('i', ',fm', '\\footnotemark')
		vim.keymap.set('i', ',ft', '\\footnotetext{}<Esc>T{i')
		vim.keymap.set('i', ',it', '\\textit{}<Esc>T{i')
		vim.keymap.set('i', ',nt', '\\textnormal{}<Esc>ha')
		vim.keymap.set('i', ',ct', '\\textcite{}<Esc>T{i')
		vim.keymap.set('i', ',ci', '\\fullbibentry{}<Esc>T{i')
		vim.keymap.set('i', ',cf', '\\footnote{Ibid.<space>\\cite{<++>}:<space><++>}')
		vim.keymap.set('i', ',ul', '\\begin{itemize}<Enter><Enter>\\end{itemize}<Esc>kA\\item<Space>')
		vim.keymap.set('i', ',ol', '\\begin{enumerate}<Enter><Enter>\\end{enumerate}<Esc>kA\\item<Space>')
		vim.keymap.set('i', ',ll', '\\begin{enumerate}[label=\\alph*)]<Enter><Enter>\\end{enumerate}<Esc>kA\\item<Space>')
		vim.keymap.set('i', ',li', '<ESC>o\\item<Space>')
		vim.keymap.set('i', ',ref', '\\ref{}<Esc>T{i')
		vim.keymap.set('i', ',chap', '\\chapter{}<Enter><Enter><++><Esc>2kf}i')
		vim.keymap.set('i', ',sec', '\\section{}<Enter><Enter><++><Esc>2kf}i')
		vim.keymap.set('i', ',ssec', '\\subsection{}<Enter><Enter><++><Esc>2kf}i')
		vim.keymap.set('i', ',sssec', '\\subsubsection{}<Enter><Enter><++><Esc>2kf}i')
		vim.keymap.set('i', ',col', '\\begin{multicols}{2}\\raggedcolumns<Enter><Enter>\\columnbreak<Enter><Enter>\\end{multicols}<Esc>3ki')
		vim.keymap.set('i', ',head', '\\vspace{0.3cm}<Enter>\\noindent<Enter>\\textbf{\\large }<Enter><Enter><++><Esc>2kf}i')
		vim.keymap.set('i', ',,', '\\')
		vim.keymap.set('i', ',tl', '\\begin{lemma}<Enter><Enter>\\end{lemma}<Esc>ki')
		vim.keymap.set('i', ',tt', '\\begin{tvrz}<Enter><Enter>\\end{tvrz}<Esc>ki')
		vim.keymap.set('i', ',tv', '\\begin{veta}<Enter><Enter>\\end{veta}<Esc>ki')
		vim.keymap.set('i', ',td', '\\begin{dusl}<enter><enter>\\end{dusl}<esc>ki')
		vim.keymap.set('i', ',te', '\\begin{definice}<enter><enter>\\end{definice}<Esc>ki')
		vim.keymap.set('i', ',tp', '\\begin{dukaz}<enter><enter>\\end{dukaz}<Esc>ki')
	end
})

-- LaTeX Math Mode
vim.api.nvim_create_autocmd("FileType", {
	group = macros_group,
	pattern = {"tex", "vimwiki"},
	callback = function()
		vim.keymap.set('i', '.mm', '$$<Esc>ha')
		vim.keymap.set('i', '.pmat', '\\begin{pmatrix}<Enter>\\\\<Enter>\\end{pmatrix}<Esc>khhi')
		vim.keymap.set('i', '.emat', '\\begin{matrix}<Enter>\\\\<Enter>\\end{matrix}<Esc>khhi')
		vim.keymap.set('i', '.vmat', '\\begin{vmatrix}<Enter>\\\\<Enter>\\end{vmatrix}<Esc>khhi')
		vim.keymap.set('i', '.lim', '\\lim_{ \\rightarrow <++>}<Space><++><Space><Esc>23hi')
		vim.keymap.set('i', '.lie', '\\frac{d }{d <++>}<Space><++><Esc>13hi')
		vim.keymap.set('i', '.par', '\\frac{\\partial }{\\partial <++>}<Space><++><Esc>20hi')
		vim.keymap.set('i', '.sum', '\\sum_{}^{<++>}<Space><++><Esc>12hi')
		vim.keymap.set('i', '.n', '\\int_{}^{<++>}<Space><++><Space>d<++><Esc>18hi')
		vim.keymap.set('i', '.ve', '\\vec{}<Esc>ha')
		vim.keymap.set('i', '.t', '\\mathrm{}<Esc>ha')
		vim.keymap.set('i', '.fr', '\\frac{}{<++>}<Space><++><Esc>12ha')
		vim.keymap.set('i', '.i', '\\infty<Space>')
		vim.keymap.set('i', '.d', '\\cdot<Space>')
		vim.keymap.set('i', '.cc', '\\lcom  \\rcom<Esc>5hi')
		vim.keymap.set('i', '.[', '\\langle<Space>')
		vim.keymap.set('i', '.]', '\\rangle<Space>')
		vim.keymap.set('i', '.j', '\\left')
		vim.keymap.set('i', '.k', '\\right')
	end
})


--	HTML
vim.api.nvim_create_autocmd("FileType", {
	group = macros_group,
	pattern = "html",
	callback = function()
		vim.keymap.set('i', ',b', '<b></b><Space><++><Esc>FbT>i')
		vim.keymap.set('i', ',it', '<em></em><Space><++><Esc>FeT>i')
		vim.keymap.set('i', ',1', '<h1></h1><Enter><Enter><++><Esc>2kf<i')
		vim.keymap.set('i', ',2', '<h2></h2><Enter><Enter><++><Esc>2kf<i')
		vim.keymap.set('i', ',3', '<h3></h3><Enter><Enter><++><Esc>2kf<i')
		vim.keymap.set('i', ',p', '<p></p><Enter><Enter><++><Esc>02kf>a')
		vim.keymap.set('i', ',a', '<a<Space>href=""><++></a><Space><++><Esc>14hi')
		vim.keymap.set('i', ',e', '<a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi')
		vim.keymap.set('i', ',ul', '<ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i')
		vim.keymap.set('i', ',li', '<Esc>o<li></li><Esc>F>a')
		vim.keymap.set('i', ',ol', '<ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i')
		vim.keymap.set('i', ',im', '<img src="" alt="<++>"><++><esc>Fcf"a')
		vim.keymap.set('i', ',td', '<td></td><++><Esc>Fdcit')
		vim.keymap.set('i', ',tr', '<tr></tr><Enter><++><Esc>kf<i')
		vim.keymap.set('i', ',th', '<th></th><++><Esc>Fhcit')
		vim.keymap.set('i', ',tab', '<table><Enter></table><Esc>O')
		vim.keymap.set('i', ',gr', '<font color="green"></font><Esc>F>a')
		vim.keymap.set('i', ',rd', '<font color="red"></font><Esc>F>a')
		vim.keymap.set('i', ',yl', '<font color="yellow"></font><Esc>F>a')
		vim.keymap.set('i', ',dt', '<dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit')
		vim.keymap.set('i', ',dl', '<dl><Enter><Enter></dl><enter><enter><++><esc>3kcc')
		vim.keymap.set('i', '&<space>', '&amp;<space>')
	end
})

-- Vimwiki
vim.api.nvim_create_autocmd("FileType", {
	group = macros_group,
	pattern = "vimwiki",
	callback = function()
		vim.keymap.set('i', ',a', '[]()<Esc>F[a')
		vim.keymap.set('i', ',1', '=<Space><Space>=<Esc>1hi')
		vim.keymap.set('i', ',2', '==<Space><Space>==<Esc>2hi')
		vim.keymap.set('i', ',3', '===<Space><Space>===<Esc>3hi')
		vim.keymap.set('i', ',4', '===<Space><Space>===<Esc>4hi')
		vim.keymap.set('i', ',li', '<ESC>o*<space>')
		vim.keymap.set('i', ',ra', '-><space>')
		vim.keymap.set('i', ',la', '<-<space>')
		vim.keymap.set('i', ',c', '<pre class ="prettyprint "><Enter>{{{<Enter>}}}<Enter></pre><Esc>kkk$hi')
		vim.keymap.set('i', ',m', '{{$%align%<Enter><Enter>}}$<Esc>ki')
	end
})
