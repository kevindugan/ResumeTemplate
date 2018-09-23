%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Academic style resume
% Author: Kevin J. Dugan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{resume}[2017/06/06 v0.1 Resume]
\NeedsTeXFormat{LaTeX2e}[1995/12/01]

\LoadClass{article}

\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{calc}
\RequirePackage{lastpage}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titling}
\RequirePackage{setspace}
\RequirePackage{tikz}
\usetikzlibrary{calc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page Setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\geometry{letterpaper,top=0.85in,bottom=0.5in,left=0.5in,right=1.0in,headheight=0.5in,headsep=0.1in,verbose}
\setlength{\parindent}{0pt}
\setlength{\parskip}{3.5ex plus 1ex minus -.2ex}
\newlength{\contentwidth}
\setlength{\contentwidth}{\textwidth - 1.1in}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author Details
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@name{Author's Name}
\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\showName}{\@name}
\def\@updated{\@empty}
\newcommand{\updated}[1]{\def\@updated{#1}}
\newcommand{\showUpdated}{\if\@updated\@empty\else Updated: \@updated\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cover Letter Option
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\coverLetter}[3]{
  \newgeometry{letterpaper, top=0.8in, bottom=0.83in, left=0.78in, right=0.78in}
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture, overlay]
    \draw[black!60, fill=black!60] ($(current page.north west) + (0.78in,0)$) rectangle ($(current page.north west) + (4.28in,-0.25in)$);
    \draw[black!60, fill=black!60] ($(current page.south west) + (0.78in,0)$) rectangle ($(current page.south west) + (4.28in,0.15in)$);
  \end{tikzpicture}
  \sffamily
  \noindent
  {\fontseries{bx} \huge \MakeUppercase{\@name}}

  {\Large #2 $\mid$ #3}

  \vspace{0.5in}

  {\bf \Large \thedate}

  \vspace{0.5in}

  {\bf \Large Dear Sir/Madame:}

  \begin{onehalfspace}
    {\large \input{#1} }
  \end{onehalfspace}

  {\large Sincerely,}

  \vspace{0.75in}

  {\bf \large \@name}

  \setcounter{page}{1}
  \restoregeometry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Boolean Definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifnewsection

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page Style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancypagestyle{resume}{
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[R]{\showName \\ \thepage/\pageref{LastPage}}
}
\pagestyle{resume}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom List
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{list2}[1][\@empty]{
	\def\@listTitle{#1}
	\def\@listMargin{1em}
	\if\@listTitle\@empty
	\else
		\def\@listMargin{0.25in}
		\textbf{#1}
	\fi
	\begin{list}{--}{%
			\setlength{\itemsep}{0in}
			\setlength{\parsep}{0in} \setlength{\parskip}{0in}
			\setlength{\topsep}{0in} \setlength{\partopsep}{0in} 
			\setlength{\leftmargin}{\@listMargin}}
	}{\end{list}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set up Author info
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\maketitle{
	\thispagestyle{empty}
	\vspace{-0.5in}
	\begin{minipage}{\textwidth}
		{\Large\bf \showName} \hfill \showUpdated
		\vspace{2pt}\hrule
	\end{minipage}\par
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section styling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@currentSectionName{}
\renewcommand\section[1]{
	\def\@currentSectionName{#1}
	\newsectiontrue
}
\newcommand{\showSectionName}{\@currentSectionName}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Handles section titles in margins
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\margin}{
	\ifnewsection
		\begin{minipage}[t]{1.0in}
			\hyphenpenalty=100000
			\raggedright
			\textsc{\small\showSectionName}
		\end{minipage}
		\newsectionfalse
	\else
		\begin{minipage}[t]{1.0in}
			\hfill
		\end{minipage}
	\fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Content Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\content}[1]{
	\margin
	\begin{minipage}[t]{\contentwidth}
		#1
	\end{minipage}
}
\newcommand{\datedContent}[2]{
	\margin
	\begin{minipage}[t]{0.65\contentwidth}
		#1
	\end{minipage}
	\begin{minipage}[t]{0.35\contentwidth}
		\begin{flushright}
			#2
		\end{flushright}
	\end{minipage}
}
\newcommand{\datedContentDescription}[3]{
	\margin
	\begin{minipage}[t]{\contentwidth}
		\begin{minipage}[t]{0.65\contentwidth}
			#1
		\end{minipage}
		\begin{minipage}[t]{0.35\contentwidth}
			\begin{flushright}
				#2
			\end{flushright}
		\end{minipage}
		\underline{Description}:#3
	\end{minipage}
}
\newcommand{\contactInfo}[2]{
	\margin
	\begin{minipage}[t]{0.5\contentwidth}
		#1
	\end{minipage}
	\begin{minipage}[t]{0.5\contentwidth}
		\begin{flushright}
			#2
		\end{flushright}
	\end{minipage}
}

\newcounter{ref}
\newcommand\reference[1]{
	\margin
	\begin{minipage}[t]{0.4\textwidth}
		#1
	\end{minipage}
	\ifnum\theref=0
		\stepcounter{ref}
	\else
		\par
		\setcounter{ref}{0}
	\fi
}
