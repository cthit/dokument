% Original by Adam Sandberg Ericsson
% https://github.com/dtekcth/dtek-tex/blob/master/dtek.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cthit}[2014/07/14 Teknologsektionen Informationsteknik Chalmers]

\newif\ifincludeaddress
\includeaddresstrue
\DeclareOption{noincludeaddress}{\includeaddressfalse}

\ProcessOptions\relax

\LoadClass[11pt]{article}

\RequirePackage[quiet]{fontspec}
\RequirePackage{parskip}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage[swedish, english]{babel}
\RequirePackage{lastpage}
\RequirePackage[unicode]{hyperref}
\RequirePackage[includeheadfoot, top=2.0cm, bottom=4cm]{geometry}
\RequirePackage{xparse}
\RequirePackage{etoolbox}

\RequirePackage{pdfpages}

\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author},
    colorlinks=true,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black
  }
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

\DeclareDocumentCommand \maketitle {} {%
  
      \begin{center}
        \vspace*{0.5cm}

        \Huge
        \textbf{Titel}
        
        \LARGE
        \vspace{0.2cm}
        \@subtitle 
        
        \vspace{0.2cm}
        
        \textbf{Teknologsektionen Informationsteknik} \\
        \Large
        \textbf{Chalmers Tekniska Högskola}

        \vspace{2cm}
        \centerline{ \includegraphics[width=0.5\textwidth]{itlogo.eps}}
        \vspace{2cm}
        
        \Large
        Antagen: \@approved \\
        Reviderad: \@revisioned 
        
    \end{center}

}

% Set up headers

\DeclareDocumentCommand \makehf {}{%
  \pagestyle{fancy}
  \fancyhf{}
  
  \newcommand{\headleft}{%
    \raisebox{-3mm}{\includegraphics[width=16mm]{itlogo}}\hspace{1mm}
    \parbox[b]{10cm}{%
      \textbf{Teknologsektionen Informationsteknik}\\
      Chalmers studentkår\\
      \@title
    }
  }
  \newcommand{\headright}{%
    Sida \thepage\ av \pageref{LastPage}\\
    \@date
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
      Hörsalsvägen 6\\
      412 58 Göteborg
    }
    
    \rfoot{%
      \begin{flushright}
        \href{mailto:styrit@chalmers.it}{styrit@chalmers.it}\\
        \href{http://chalmers.it}{https://chalmers.it}
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