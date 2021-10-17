" LaTeX
autocmd FileType tex inoremap ,fr \begin{frame}[fragile]<Enter>\frametitle{}<Enter>\begin{itemize}<Enter>\item <++><Enter>\end{itemize}<Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ,fi \begin{figure}[h]<Enter>\centering<Enter>\includegraphics[height=]{}<Enter>\caption[]{}<Enter>\label{fig:}<Enter>\end{figure}<Esc>3k$i
autocmd FileType tex inoremap ,ff \frame{<Enter>\begin{figure}[!htb]<Enter>\begin{minipage}{0.4\textwidth}<Enter>\centering<Enter>\includegraphics[height=.8\linewidth]{}<Enter>\caption{<++>\footnotemark}<Enter>\end{minipage}\hfill<Enter>\begin{minipage}{0.4\textwidth}<Enter>\centering<Enter>\includegraphics[height=.8\linewidth]{<++>}<Enter>\caption{<++>\footnotemark}<Enter>\end{minipage}<Enter>\end{figure}<Enter>\footnotetext[]{Obrázek z URL: \url{<++>}}<Enter>\footnotetext[]{Obrázek z URL: \url{<++>}}<Enter>}<Esc>11k$i
autocmd FileType tex inoremap ,tab \begin{figure}[h]<Enter>\centering<Enter>\begin{center}<Enter>\begin{longtable}{\| m{4cm} \| m{4cm} \| m{4cm} \| }<Enter>\hline<Enter>\hline<Enter>\end{longtable}<Enter>\end{center}<Enter>\caption[]{}<Enter>\label{fig:}<Enter>\end{figure}<Esc>2ki
autocmd FileType tex inoremap ,ls \begin{figure}[h]<Enter>\centering<Enter>\begin{minted}[mathescape,escapeinside=@@,linenos,numbersep=5pt,frame=lines,breaklines,tabsize=3,framesep=2mm]{}<Enter>\end{minted}<Enter>\caption[]{}<Enter>\label{fig:}<Enter>\end{figure}<Enter><Esc>5k$i
autocmd FileType tex inoremap ,ra $\Rightarrow$<space>
autocmd FileType tex inoremap ,la $\Leftarrow$<space>
autocmd FileType tex inoremap ,nu $\varnothing$
autocmd FileType tex inoremap ,em \emph{} <++><Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{} <++><Esc>T{i
autocmd FileType tex inoremap ,uv \uv{} <++><Esc>T{i
autocmd FileType tex inoremap ,fn \footnote{} <++><Esc>T{i
autocmd FileType tex inoremap ,fm \footnotemark <++>
autocmd FileType tex inoremap ,ft \footnotetext{} <++><Esc>T{i
autocmd FileType tex inoremap ,it \textit{} <++><Esc>T{i
autocmd FileType tex inoremap ,ct \textcite{} <++><Esc>T{i
autocmd FileType tex inoremap ,ci \fullbibentry{} <++><Esc>T{i
autocmd FileType tex inoremap ,cf \footnote{c.<space>d.<space>\cite{<++>}:<space><++>}
autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,ll \begin{enumerate}[label=\alph*)]<Enter><Enter>\end{enumerate}<Esc>kA\item<Space>
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Esc>kA\item<Space>
autocmd FileType tex inoremap ,li <ESC>o\item<Space>
autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ,h \vspace{0.3cm}<Enter>\noindent<Enter>\textbf{\large }<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,, \


"	HTML
autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap ,it <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
autocmd FileType html inoremap &<space> &amp;<space>

"	Markdown
autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
autocmd FileType markdown,rmd inoremap ,li <Esc>o+<Space>

autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kOo

" Vimwiki
autocmd Filetype vimwiki inoremap ,a [](<++>)<++><Esc>F[a
autocmd Filetype vimwiki inoremap ,1 =<Space><Space>=<Esc>1hi
autocmd Filetype vimwiki inoremap ,2 ==<Space><Space>==<Esc>2hi
autocmd Filetype vimwiki inoremap ,3 ===<Space><Space>===<Esc>3hi
autocmd Filetype vimwiki inoremap ,4 ===<Space><Space>===<Esc>4hi
autocmd Filetype vimwiki inoremap ,li *
