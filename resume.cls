%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
% Modified 2019-04-11 by Justin L. Espiritu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\ProvidesClass{resume}[2019-04-11 v1.0 Resume class]

\LoadClass[8pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{setspace}
\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name #1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \address #1{\def\@address{#1}}
\def \@address {}

\def \phone #1{\def\@phone{#1}}
\def \@phone {}

\def \email #1{\def\@email{#1}}
\def \@email {}

\def \seperator {\hspace*{1pt} $|$ \hspace*{1pt}} % Set default address separator to '|'

% Optional title definitions
\let \@titleOne \relax
\let \@titleTwo \relax
\let \@titleThree \relax

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def \nameSize{\Large} % Size of the name at the top of the document
\def \headerSpacing{\linespread{.5}}
\def \infoSize{\footnotesize}
\def \addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def \sectionlineskip{\medskip} % The space above the horizontal line for each section 

\def\sectionskip{\medskip} % The space after the heading section

%----------------------------------------------------------------------------------------
%	PRINT HEADER FUNCTION DEFINITIONS
%----------------------------------------------------------------------------------------


\def \title #1{
  \@ifundefined{@titleOne}{
    \def \@titleOne{#1}
  }{\@ifundefined{@titleTwo}{
    \def \@titleTwo{#1}
  }}{
    \def \@titleThree{#1}
  }
}

\def \printTitles {
  \begingroup
    \@ifundefined{@titleOne}{}{
      \@titleOne \hspace*{-7pt} %TODO:  Figure out why this adds space
      \@ifundefined{@titleTwo}{}{
          \seperator \@titleTwo \hspace*{-7pt} %TODO:  Figure out why this adds space
          \@ifundefined{@titleThree}{}{
            \seperator \@titleThree
          }
        }
      } 
    \\*
  \endgroup 
}

\def \printName {
  \begingroup
    {\MakeUppercase
      {\nameSize\bf \@name}
    }
    \\* \rule{275pt}{1pt} \\* %TODO: make dynamic
  \endgroup
}

\def \printContactInfo {
    \begingroup
      \@address \seperator \@phone \seperator \@email
    \endgroup
}
%----------------------------------------------------------------------------------------
%	START HEADER
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printName
  \printTitles % Optional
  \printContactInfo
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \MakeUppercase{\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
    \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\bf #1} \hfill {#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\em #3} \hfill {\em #4} % Italic job title and location
  }\smallskip

  \begin{spacing}{0.75}
  \begin{list}{$\cdot$}{\leftmargin=1em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
   
  }{
  \end{list}
  \end{spacing}
  \vspace{0.5em} % Some space after the list of bullet points
}


