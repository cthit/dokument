% Modified by Johan "Horv" Andersson
% Original by Adam Sandberg Ericsson
% https://github.com/dtekcth/dtek-tex/blob/master/dtek.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cthit}[2014/07/14 Teknologsektionen Informationsteknik Chalmers]

\newif\ifincludeaddress
\includeaddresstrue
\DeclareOption{noincludeaddress}{\includeaddressfalse}

\newif\ifincludeauthors
\includeauthorstrue
\DeclareOption{noincludeauthors}{\includeaddressfalse}

\newif\ifpagination
\paginationtrue
\DeclareOption{nopagination}{\paginationfalse}

\ProcessOptions\relax

\LoadClass[11pt, a4paper]{article}

\RequirePackage[quiet]{fontspec}
\RequirePackage{parskip}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage[english]{babel}
\RequirePackage{lastpage}
\RequirePackage[unicode]{hyperref}
\RequirePackage[includeheadfoot, top=2.0cm, bottom=4cm]{geometry}
\RequirePackage{xparse}
\RequirePackage{etoolbox}

\RequirePackage{pdfpages}

\definecolor{linkblue}{HTML}{0000ee}

\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author},
    colorlinks=true,
    citecolor=black,
    filecolor=black,
    linkcolor=black
  }
}

\newenvironment{att}{ 
  \begin{list}{\small{\textbf{to}}}{}
}{
  \end{list}
}

\DeclareDocumentCommand \paragraphref {m}{%
    §\ref{#1}%
}

 %mbox to prevent line-breaking on name
\DeclareDocumentCommand \HUBBEN {}{\mbox{Hubben}}

\DeclareDocumentCommand \THECLOUD {}{\mbox{The Cloud}}

\DeclareDocumentCommand \PRIT {}{\mbox{P.R.I.T.}}
\DeclareDocumentCommand \PRITFULL {}{%
  PR-committee and Rustmästeriet Informationsteknik, \PRIT{}%
}

\DeclareDocumentCommand \SEXIT {}{\mbox{\textsc{sex}IT}}
\DeclareDocumentCommand \SEXITFULL {}{%
  Sexmästeriet Informationsteknik, \SEXIT{}%
}

\DeclareDocumentCommand \STYRIT {}{\mbox{styrIT}}
\DeclareDocumentCommand \STYRITFULL {}{%
  Student Division Board, \STYRIT{}%
}

\DeclareDocumentCommand \NOLLKIT {}{\mbox{NollKIT}}
\DeclareDocumentCommand \NOLLKITFULL {}{%
  Reception Committee Informationsteknik, \NOLLKIT{}%
}

\DeclareDocumentCommand \DIGIT {}{\mbox{digIT}}
\DeclareDocumentCommand \DIGITFULL {}{%
  Datorinformationsgruppen Informationsteknik, \DIGIT{}%
}

\DeclareDocumentCommand \DRAWIT {}{\mbox{DrawIT}}
\DeclareDocumentCommand \DRAWITFULL {}{%
  Board game society, \DRAWIT{}%
}

\DeclareDocumentCommand \ARMIT {}{\mbox{ArmIT}}
\DeclareDocumentCommand \ARMITFULL {}{%
  Arbetsmaknadsgruppen Informationsteknik, \ARMIT{}%
}

\DeclareDocumentCommand \SNIT {}{\mbox{snIT}}
\DeclareDocumentCommand \SNITFULL {}{%
  Education Committee Informationsteknik, \SNIT{}%
}

\DeclareDocumentCommand \FRITID {}{\mbox{frITid}}
\DeclareDocumentCommand \FRITIDFULL {}{%
  Idrottsföreningen Informationsteknik, \FRITID{}
}

\DeclareDocumentCommand \EIGHTBIT {}{\mbox{8-bIT}}
\DeclareDocumentCommand \EIGHTBITFULL {}{%
  TV-spelsföreningen, \EIGHTBIT{}%
}

\DeclareDocumentCommand \HOOKIT {}{\mbox{HookIT}}
\DeclareDocumentCommand \HOOKITFULL {}{%
  Häfv- och odygdskommittén på IT-sektionen, \HOOKIT{}%
}

\DeclareDocumentCommand \FANBARERIT {}{\mbox{FanbärerIT}}
\DeclareDocumentCommand \FANBARERITFULL {}{%
  Fanbärarna Informationsteknik, \FANBARERIT{}%
}

\DeclareDocumentCommand \FLASHIT {}{\mbox{FlashIT}}
\DeclareDocumentCommand \FLASHITFULL {}{%
  Film- och fotoföreningen Informationsteknik, \FLASHIT{}%
}

\DeclareDocumentCommand \MRCIT {}{\mbox{MRCIT}}
\DeclareDocumentCommand \MRCITFULL {}{%
  Master Reception Committee Information Technology, \MRCIT{}%
}

\DeclareDocumentCommand \FIKIT {}{\mbox{FikIT}}
\DeclareDocumentCommand \FIKITFULL {}{%
  Fika and baking society, \FIKIT{}%
}

\DeclareDocumentCommand \MYhref { O{linkblue} m m }{%
  \href{#2}{\color{#1}{#3}}%
}

\DeclareDocumentCommand \subtitle {m} {%
  \DeclareDocumentCommand \@subtitle {}{#1}
}

\DeclareDocumentCommand \approved {m} {%
  \DeclareDocumentCommand \@approved {}{#1}
}

\DeclareDocumentCommand \revisioned {m} {%
  \DeclareDocumentCommand \@revisioned {}{#1}
}

\DeclareDocumentCommand \editorial {m} {%
  \DeclareDocumentCommand \@editorial {}{#1}
}

\DeclareDocumentCommand \authors {m} {%
  \DeclareDocumentCommand \@authors {}{#1}
}

\DeclareDocumentCommand \maketitle {} {%
  
      \begin{center}
        \vspace*{0.5cm}

                
        {\bf\Huge \@title\par}
  
        \vspace{0.2cm}
        \ifdef{\@subtitle}{{\LARGE \@subtitle\par}}{}

        \vspace{0.2cm}
        
        \textbf{the Software Engineering Student Division (IT)} \\
        \Large
        \textbf{Chalmers University of Technology}

        \vspace{2cm}
        \centerline{ \includegraphics[width=0.5\textwidth]{itlogo.eps}}
        \vspace{2cm}
        
        \Large

        \ifincludeauthors
          \ifdef{\@authors}{{\@authors}}{}
          \vspace{2cm}
        \fi
        
        \ifdef{\@approved}{{Approved: \@approved \\}}{}
        \ifdef{\@revisioned}{{Revisioned: \@revisioned}}{}
        \ifdef{\@editorial}{{Editorial revision: \@editorial}}{}
        
        
    \end{center}
}


\DeclareDocumentCommand \makesimpletitle {} {%
  
    \begin{center}
        \vspace*{0.5cm}

                
        {\bf\Huge \@title\par}
  
        \vspace{0.2cm}
        \ifdef{\@subtitle}{{\LARGE \@subtitle\par}}{}

        \ifincludeauthors
          \ifdef{\@authors}{{\Large\@authors}}{}
          \vspace{2cm}
        \fi

    \end{center}
}

% Set up headers

\DeclareDocumentCommand \makehf {}{%
  \pagestyle{fancy}
  \fancyhf{}
  
  \newcommand{\headleft}{%
    \raisebox{-3mm}{\includegraphics[width=16mm]{itlogo}}\hspace{1mm}
    \parbox[b]{12cm}{%
      \textbf{the Software Engineering Student Division (IT)}\\
      Chalmers Student Union\\
      \@title
    }
  }

  \newcommand{\headright}{%
    \ifpagination
      Page \thepage\ of \pageref{LastPage}\\
    \fi
    \ifdef{\@revisioned}{{\@revisioned}}{}
  }
  
  % Calculate header height
  \settototalheight\headheight{\headleft}
  \addtolength\headheight{1.0pt}
  
  \lhead{\headleft}

    \rhead{\headright}

  
  \renewcommand{\headrule}{
    \nointerlineskip
    \hskip 16mm\hrulefill
  }

  \renewcommand{\footrulewidth}{\headrulewidth}

  \ifincludeaddress
  
    \lfoot{%
      \flushleft Teknologsektionen Informationsteknik\\
      Hörsalsvägen 9\\
      412 58 Göteborg
    }
    
    \rfoot{%
      \begin{flushright}
        \href{mailto:styrit@chalmers.it}{styrit@chalmers.it}\\
        \href{https://chalmers.it}{https://chalmers.it}
      \end{flushright}
    }
  \fi
}

\DeclareDocumentCommand \makeheadfoot {}{\makehf}

\DeclareDocumentCommand \makesign {m} {%
  \parbox{0.47\textwidth}{%
    \vspace{2cm}
    \rule{0.47\textwidth}{0.5pt}\\
    #1
  }
}

\endinput
