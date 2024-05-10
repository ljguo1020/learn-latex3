\ProvidesClass{learn}

\LoadClass[twoside, openany, a4paper]{book}



\RequirePackage[UTF8, scheme=plain, fontset=none, heading=true]{ctex}
\setCJKmainfont[Path=./fonts/, BoldFont={LXGWWenKai-Bold},ItalicFont={LXGWWenKai-Light}]{LXGWWenKai-Regular}
\setCJKsansfont[Path=./fonts/, BoldFont={LXGWWenKai-Bold}]{LXGWWenKai-Regular}
\setCJKmonofont[Path=./fonts/, BoldFont={LXGWWenKaiMono-Bold},ItalicFont={LXGWWenKaiMono-Light}]{LXGWWenKaiMono-Regular}

\ctexset{
  chapter={
    format+=\raggedright,
    name = {第,部分},
    afterskip = .5cm
  },
  section={
    format+=\raggedright,
    afterskip = .5cm
  },
  contentsname = {目次}
}

\RequirePackage{fontspec}
\IfFontExistsTF{calibri.ttf}
{
  \setmainfont{calibri.ttf}[
    BoldFont = calibrib.ttf,
    ItalicFont = calibrii.ttf,
    BoldItalicFont = calibriz.ttf
  ]
}
{}


\RequirePackage[margin=2.71828cm]{geometry}
\RequirePackage[listings,breakable]{tcolorbox}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{amsfonts,amsmath}
\usetikzlibrary{arrows.meta}
\RequirePackage{graphicx}
\graphicspath{{cover/}}


\ExplSyntaxOn
\clist_new:N \l_function_variant_list %fuction variant list
\NewDocumentCommand{\function}{svo} % #1:function name #2: variant list
{
  \IfBooleanTF{#1}
  {
    \IfNoValueTF{#3}
    {
      \begin{tcolorbox}[width=\textwidth,left=1mm,right=1mm,top=1mm,bottom=1mm,sharp~corners,colback=white,boxrule=.5pt,colback=lime!30]
        \texttt{Function}\hskip -2pt \Triangle\hskip -3pt \texttt{#2}\hfill \examplelabel*
      \end{tcolorbox}
    }
    {
     \clist_gset:Nn \l_function_variant_list {#3}
      \begin{tcolorbox}[width=\textwidth,left=1mm,right=1mm,top=1mm,bottom=1mm,sharp~corners,colback=white,boxrule=.5pt,colback=lime!30]
        \texttt{Function}\hskip -2pt \Triangle\hskip -3pt \texttt{#2\textcolor{gray}{(\clist_use:Nn \l_function_variant_list{|})}} \hfill \examplelabel*
      \end{tcolorbox}
    }
  }
  {
      \IfNoValueTF{#3}
     {
       \def\functionn{
          \texttt{#2}
         }
     }
     {
        \clist_gset:Nn \l_function_variant_list {#3}
        \def\functionn{
          \texttt{
            #2
            \textcolor{gray}{(\clist_use:Nn \l_function_variant_list{|})} 
            }
          }
     }
  }

}
\NewDocumentCommand{\examplelabel}{s}
{
  \IfBooleanTF{#1}{
  \raisebox{-0.5ex}{
  \tikz{
  \node[ball~color=purple,circle,outer~sep=0pt,scale=0.5] {\phantom{2}};  
    }}
  }{
     \raisebox{-0.5ex}{
     \tikz{
    \node[ball~color=cyan,circle,outer~sep=0pt,scale=0.5,font=\bfseries] {\theexample};  
    }}
  }
}
\ExplSyntaxOff
\def\Triangle{ % triangle icon
  \raisebox{-0.3ex}{
  \tikz{
    \fill[scale=2,outer sep=0pt] (240:0.5ex) -- (0:0.5ex) -- (120:0.5ex);
  }
}}
\newcounter{example}
\tcbset{
    example style/.style={
        sharp corners,
        colback=white,
        boxrule=.5pt,
        breakable,
        left=1mm,right=1mm,top=1mm,bottom=1mm,
        before title=\texttt{Function\hskip -3pt \Triangle\hskip -5pt},
        fonttitle=\bfseries,
        colbacktitle=lime!30,
        coltitle=black,
        title={~},
    }
}

\newtcblisting[use counter=example]{example}{
  listing options={
    style=tcblatex,
    language={[LaTeX]TeX},
    % keywordstyle=\color{cyan!50!green}\bfseries,
    keywordstyle={\color[RGB]{178,34,34}\bfseries},
    commentstyle={\color[RGB]{102,205,170}\itshape}
  },
  example style,title = {\functionn\hfill\examplelabel\label{demo:\theexample}}}

\RequirePackage{hyperref}
\hypersetup{colorlinks,linkcolor=blue}
\def\demoref#1{\hyperref[demo:#1]{演示#1}}

\RequirePackage{fancyhdr}
\fancyhf{}
\fancyhead[LE]{\LaTeX3 入门}
\fancyhead[RO]{\leftmark}
\fancyfoot[c]{\thepage}
\headheight=13pt
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}






\def\maketitle{%
\titlepage
\begin{center}
  \vspace*{2cm}
  \bfseries
  \Huge\@title\\[10pt]
  \LARGE\@author\\[8pt]
  \LARGE\@date\\
  \vspace{3.5cm}
  \includegraphics[width = \textwidth]{cover}
\end{center}
\endtitlepage
}


\raggedbottom