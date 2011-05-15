\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\ProvidesClass{IIBproject}[2000/06/05 - declaration updated. Bugs to tpl@eng]
\newif\if@cuedwide
\@cuedwidefalse

\DeclareOption{a5paper}
    {\ClassError{IIBproject}{Option `a5paper' not supported}{}}
\DeclareOption{b5paper}
    {\ClassError{IIBproject}{Option `b5paper' not supported}{}}
\DeclareOption{twocolumn}%
    {\ClassError{IIBproject}{Option `twocolumn' not supported}{}}
\DeclareOption{titlepage}%
    {\ClassError{IIBproject}{Option `titlepage' not supported}{}}
\DeclareOption{wide}
    {\@cuedwidetrue\typeout{Wide option selected}}
\PassOptionsToClass{12pt,a4paper}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
\if@cuedwide
\oddsidemargin=0pt \evensidemargin=0pt \topmargin=0pt \textwidth=421pt \textheight=612pt
\fi
\renewcommand{\abstractname}{Summary}
\def\projectgroup#1{\gdef\@projectgroup{#1}\gdef\theprojectgroup{#1}}


\if@titlepage
  \renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \let\thanks\relax\let\maketitle\relax
  \gdef\@thanks{}\gdef\@author{}\gdef\@title{}}
\else
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks % tpl - remove page number 
  \endgroup
  \setcounter{footnote}{0}%
  \let\thanks\relax
  \let\maketitle\relax\let\@maketitle\relax
  \gdef\@thanks{}\gdef\@author{}\gdef\@title{}}
\def\@maketitle{%
  \newpage
  \null
  \vskip 6.15cm%
  \begin{center}%
    {\Large \@title \par}%
    {by\par}
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
\vskip 2mm 
   Fourth-year undergraduate project in\\Group \@projectgroup, 2010/2011%
  \end{center}%
  \par
%\vskip 6cm%
%\noindent I hereby declare that, except where specifically indicated, 
%the work submitted herein is my own original work.

%\vskip 1cm %or some other suitable small distance
%\begin{center}
%Signed: \underline{\hspace{6cm}} Date: \underline{\hspace{3cm}}
%\end{center}
\begin{table}[b]
\begin{tabular}{l}
I hereby declare that, except where specifically indicated, the work\\ 
submitted herein is my own original work.\\
\\
Signed: \underline{\hspace{6cm}} Date: \underline{\hspace{3cm}}
\end{tabular}
\end{table}
\newpage}
\fi

\endinput

