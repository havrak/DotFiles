"LaTeX
autocmd FileType tex inoremap ,frames \begin{frame}[fragile]<Enter>\frametitle{}<Enter>\begin{itemize}<Enter>\item <++><Enter>\end{itemize}<Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ,framei \begin{frame}[fragile]<Enter>\begin{figure}[!htb]<Enter>\begin{minipage}{0.48\textwidth}<Enter>\centering<Enter>\includegraphics[height=.8\linewidth]{}<Enter>\caption{<++>\footnotemark}<Enter>\end{minipage}\hfill<Enter>\begin{minipage}{0.48\textwidth}<Enter>\centering<Enter>\includegraphics[height=.8\linewidth]{<++>}<Enter>\caption{<++>\footnotemark}<Enter>\end{minipage}<Enter>\end{figure}<Enter>\footnotetext[]{Obrázek z URL: \url{<++>}}<Enter>\footnotetext[]{Obrázek z URL: \url{<++>}}<Enter>\end{frame}<Esc>11k$i
autocmd FileType tex inoremap ,framed \begin{frame}[fragile]<Enter>\begin{minipage}{0.48\textwidth}<Enter><Enter>\end{minipage}\hfill<Enter>\begin{minipage}{0.48\textwidth}<Enter><++><Enter>\end{minipage}<Enter>\end{frame}<Esc>5k$i

autocmd FileType tex inoremap ,fig \begin{figure}[h]<Enter>\begin{center}<Enter><Enter>\caption[]{}<Enter>\label{fig:}<Enter>\end{center}<Enter>\end{figure}<Esc>4k$i

autocmd FileType tex inoremap ,ctab \begin{center}\begin{longtable}{\| m{4cm} \| m{4cm} \| m{4cm} \| }<Enter>\hline<Enter><Enter>\hline<Enter><++><Enter>\hline<Enter>\end{longtable}\begin{center}<Esc>5ki
autocmd FileType tex inoremap ,ckod \begin{center}\begin{minted}[mathescape,escapeinside=@@,linenos,numbersep=5pt,frame=lines,breaklines,tabsize=3,framesep=2mm]{}<Enter><Enter>\end{minted}\begin{center}<Esc>3k$i
autocmd FileType tex inoremap ,cimg \begin{center}\includegraphics[width=0.8\textwidth]{}\end{center}<Esc>ki

autocmd FileType tex inoremap ,tab \begin{longtable}{\| m{4cm} \| m{4cm} \| m{4cm} \| }<Enter>\hline<Enter><Enter>\hline<Enter><++><Enter>\hline<Enter>\end{longtable}<Esc>4ki
autocmd FileType tex inoremap ,kod \begin{minted}[mathescape,escapeinside=@@,linenos,numbersep=5pt,frame=lines,breaklines,tabsize=3,framesep=2mm]{}<Enter><Enter>\end{minted}<Esc>2k$i
autocmd FileType tex inoremap ,img \includegraphics[width=0.8\textwidth]{}<Esc>i


autocmd FileType tex inoremap ,ra $\Rightarrow$<space>
autocmd FileType tex inoremap ,la $\Leftarrow$<space>
autocmd FileType tex inoremap ,em \emph{}<Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{}<Esc>T{i
autocmd FileType tex inoremap ,ud \underline{}<Esc>T{i
autocmd FileType tex inoremap ,uv \uv{}<Esc>T{i
autocmd FileType tex inoremap ,fn \footnote{}<Esc>T{i
autocmd FileType tex inoremap ,fm \footnotemark
autocmd FileType tex inoremap ,ft \footnotetext{}<Esc>T{i
autocmd FileType tex inoremap ,it \textit{}<Esc>T{i
autocmd FileType tex inoremap ,ct \textcite{}<Esc>T{i
autocmd FileType tex inoremap ,ci \fullbibentry{}<Esc>T{i
autocmd FileType tex inoremap ,cf \footnote{Ibid.<space>\cite{<++>}:<space><++>}
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Esc>kA\item<Space>
autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Esc>kA\item<Space>
autocmd FileType tex inoremap ,ll \begin{enumerate}[label=\alph*)]<Enter><Enter>\end{enumerate}<Esc>kA\item<Space>
autocmd FileType tex inoremap ,li <ESC>o\item<Space>
autocmd FileType tex inoremap ,ref \ref{}<Esc>T{i
autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,col \begin{multicols*}{2}<Enter><Enter>\columnbreak<Enter><Enter>\end{multicols*}<Esc>3ki
autocmd FileType tex inoremap ,head \vspace{0.3cm}<Enter>\noindent<Enter>\textbf{\large }<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex,vimwiki inoremap ,, \

autocmd FileType tex inoremap ,tl \begin{lemma}<Enter><Enter>\end{lemma}<Esc>ki
autocmd FileType tex inoremap ,tt \begin{tvrz}<Enter><Enter>\end{tvrz}<Esc>ki
autocmd FileType tex inoremap ,tv \begin{veta}<Enter><Enter>\end{veta}<Esc>ki
autocmd filetype tex inoremap ,td \begin{dusl}<enter><enter>\end{dusl}<esc>ki
autocmd filetype tex inoremap ,te \begin{definice}<enter><enter>\end{definice}<esc>ki
autocmd filetype tex inoremap ,tp \begin{dukaz}<enter><enter>\end{dukaz}<esc>ki

" LaTeX Math Mode
autocmd FileType tex,vimwiki inoremap .mm $$<Esc>ha
autocmd FileType tex,vimwiki inoremap .mat \begin{pmatrix}<Enter>\\<Enter>\end{pmatrix}<Esc>khhi
autocmd FileType tex,vimwiki inoremap .lim \lim_{ \rightarrow <++>}<Space><++><Space><Esc>23hi
autocmd FileType tex,vimwiki inoremap .lie \frac{d }{d <++>}<Space><++><Esc>13hi
autocmd FileType tex,vimwiki inoremap .par \frac{\partial }{\partial <++>}<Space><++><Esc>20hi
autocmd FileType tex,vimwiki inoremap .sum \sum_{}^{<++>}<Space><++><Esc>12hi
autocmd FileType tex,vimwiki inoremap .n \int_{}^{<++>}<Space><++><Space>d<++><Esc>18hi
autocmd FileType tex,vimwiki inoremap .v \vec{}<Esc>ha
autocmd FileType tex,vimwiki inoremap .t \text{}<Esc>ha
autocmd FileType tex,vimwiki inoremap .fr \frac{}{<++>}<Space><++><Esc>12ha
autocmd FileType tex,vimwiki inoremap .i \infty<Space>
autocmd FileType tex,vimwiki inoremap .d \cdot<Space>
autocmd FileType tex,vimwiki inoremap .cc \lcom  \rcom<Esc>5hi
autocmd FileType tex,vimwiki inoremap .[ \langle<Space>
autocmd FileType tex,vimwiki inoremap .] \rangle<Space>
autocmd FileType tex,vimwiki inoremap .j \left
autocmd FileType tex,vimwiki inoremap .k \right


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

" C
autocmd FileType h,cpp,hpp inoremap ,ou cout <<  << "\n";<ESC>8hi

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
autocmd Filetype vimwiki inoremap ,a []()<Esc>F[a
autocmd Filetype vimwiki inoremap ,1 =<Space><Space>=<Esc>1hi
autocmd Filetype vimwiki inoremap ,2 ==<Space><Space>==<Esc>2hi
autocmd Filetype vimwiki inoremap ,3 ===<Space><Space>===<Esc>3hi
autocmd Filetype vimwiki inoremap ,4 ===<Space><Space>===<Esc>4hi
autocmd Filetype vimwiki inoremap ,li <ESC>o*<space>
autocmd FileType vimwiki inoremap ,ra -><space>
autocmd FileType vimwiki inoremap ,la <-<space>
autocmd FileType vimwiki inoremap ,c <pre class ="prettyprint "><Enter>{{{<Enter>}}}<Enter></pre><Esc>kkk$hi
autocmd FileType vimwiki inoremap ,m {{$%align%<Enter><Enter>}}$<Esc>ki

