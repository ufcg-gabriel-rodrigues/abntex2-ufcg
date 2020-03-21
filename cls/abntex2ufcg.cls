%% programaalianca.cls
%% Copyright 2020 by Gabriel Sales Lins Rodrigues
%%
%% Customizações do abnTeX2 (http://abnTeX2.googlecode.com) para a Universidade Federal de Campina Grande
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Gabriel Sales Lins Rodrigues, gabriel.rodrigues@ee.ufcg.edu.br
%%
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/
%%
%% This work consists of the file abntex2ufcg.cls

% ---
% Declaração da classe 'abntex2ufcg' como uma extensão da classe 'abntex2'
% ---
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cls/abntex2ufcg}
\LoadClassWithOptions{abntex2}

% ---
% Pacotes obrigatórios
% ---
\RequirePackage{expl3}
\RequirePackage[refpage]{nomencl}
\RequirePackage{environ}
\RequirePackage{pdflscape}
\RequirePackage{afterpage}
\RequirePackage{color}
\RequirePackage[final]{pdfpages}
\RequirePackage{totalcount}

% ---
% Opções do curso
% ---
\newif\if@cursogenmas	\@cursogenmasfalse
\newif\if@cursoplural	\@cursopluralfalse

\newif\if@engeletrica	\@engeletricafalse
\newif\if@engquimica	\@engquimicafalse

\DeclareOption{engeletrica}{\@engeletricatrue \input{cls/courses/engeletrica.sty}}
\DeclareOption{engquimica}{\@engquimicatrue \input{cls/courses/engquimica.sty}}

% ---
% Opções do tipo de documento
% ---
\newif\if@prm \@prmfalse
\newif\if@msc \@mscfalse
\newif\if@prd \@prdfalse
\newif\if@qlf \@qlffalse
\newif\if@dsc \@dscfalse

\DeclareOption{prm}{\@prmtrue \newcommand{\doctype}{prm} \input{cls/doctype/projetom.sty}}
\DeclareOption{msc}{\@msctrue \newcommand{\doctype}{msc} \input{cls/doctype/mestrado.sty}}
\DeclareOption{prd}{\@prdtrue \newcommand{\doctype}{prd} \input{cls/doctype/projetod.sty}}
\DeclareOption{qlf}{\@qlftrue \newcommand{\doctype}{qlf} \input{cls/doctype/qualificacaod.sty}}
\DeclareOption{dsc}{\@dsctrue \newcommand{\doctype}{dsc} \input{cls/doctype/doutorado.sty}}

% ---
% Processa opções na ordem de declaração deste documento
% ---
\ProcessOptions\relax

% ---
% Redefinição de fontes do documento
% ---
\renewcommand\normalsize{%
	\@setfontsize\normalsize\@xiipt{14.5}%
	\abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
	\belowdisplayskip \abovedisplayskip
	\let\@listi\@listI}
\normalsize

\renewcommand\small{%
	\@setfontsize\small\@xipt{13.6}%
	\abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
	\def\@listi{\leftmargin\leftmargini
		\topsep 9\p@ \@plus3\p@ \@minus5\p@
		\parsep 4.5\p@ \@plus2\p@ \@minus\p@
		\itemsep \parsep}%
	\belowdisplayskip \abovedisplayskip
}

\renewcommand\footnotesize{%
	\@setfontsize\footnotesize\@xpt\@xiipt
	\abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
	\def\@listi{\leftmargin\leftmargini
		\topsep 6\p@ \@plus2\p@ \@minus2\p@
		\parsep 3\p@ \@plus2\p@ \@minus\p@
		\itemsep \parsep}%
	\belowdisplayskip \abovedisplayskip
}

\renewcommand\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
\renewcommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
\renewcommand\large{\@setfontsize\large\@xivpt{18}}
\renewcommand\Large{\@setfontsize\Large\@xviipt{22}}
\renewcommand\LARGE{\@setfontsize\LARGE\@xxpt{25}}
\renewcommand\huge{\@setfontsize\huge\@xxvpt{30}}
\let\Huge=\huge

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand*{\mit}{\@fontswitch{\relax}{\mathnormal}}

\renewcommand{\ABNTEXchapterfont}{\normalfont\fontseries{b}\selectfont}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize}

\renewcommand{\ABNTEXpartfont}{\ABNTEXchapterfont}
\renewcommand{\ABNTEXpartfontsize}{\Huge}

\renewcommand{\ABNTEXsectionfont}{\ABNTEXchapterfont}
\renewcommand{\ABNTEXsectionfontsize}{\ABNTEXchapterfontsize}

\renewcommand{\ABNTEXsubsectionfont}{\ABNTEXsectionfont}
\renewcommand{\ABNTEXsubsectionfontsize}{\ABNTEXchapterfontsize}

\renewcommand{\ABNTEXsubsubsectionfont}{\ABNTEXsubsectionfont}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\ABNTEXchapterfontsize}

\renewcommand{\ABNTEXsubsubsubsectionfont}{\ABNTEXsubsectionfont}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\ABNTEXchapterfontsize}

% ---
% Parâmetros fixos da adaptação para a Universidade Federal de Campina Grande
% ---
\instituicao{Universidade Federal de Campina Grande}
\local{Campina Grande, Para\'{\i}ba, Brasil}

% ---
% Comandos relativos à área de concentração
% ---
\newcommand\area[1]{\newcommand\imprimirarea{#1}}

% ---
% Impressão de linha de assinatura da banca na folha de aprovação
% ---
\ExplSyntaxOn
\seq_new:N \g_membros_banca
\int_new:N \g_membros_banca_cnt
\int_set:Nn \g_membros_banca_cnt 0
\newcommand{\membrobanca}[1]{
	\seq_push:Nn \g_membros_banca {#1}
	\int_incr:N \g_membros_banca_cnt
}

\newcommand{\imprimirassinaturabanca}{
	\int_new:N \l_membros_banca_idx
	\int_set:Nn \l_membros_banca_idx \g_membros_banca_cnt
	\int_while_do:nn { \l_membros_banca_idx > 0 }{
		\assinatura{ \seq_item:Nn \g_membros_banca {\l_membros_banca_idx }\\Componente~da~Banca}\vfil\null
		\int_decr:N \l_membros_banca_idx
	}
}
\ExplSyntaxOff

% ---
% Impressão de linha de assinatura dos orientadores na folha de aprovação
% ---
\newcommand{\imprimirassinaturaorientadores}{
	\assinatura{\imprimirorientador\\Orientador}
	\ifthenelse{\equal{\imprimircoorientador}{}}{}{\vfil\null\assinatura{\imprimircoorientador\\Orientador}}
}

% ---
% Alteração do aspecto da cor azul
% ---
\definecolor{blue}{RGB}{41,5,195}

% ---
% Definição de comando 'rowht' que modifica altura de uma linha da tabela
% ---
\newcommand\rowht[2][0]{\addstackgap[.5\dimexpr#2\relax]{\vphantom{#1}}}

% ---
% Redefinição de estilo do sumário
% ---
\renewcommand*{\l@part}[2]{
	\ifnum \c@tocdepth >-2\relax
		\addpenalty{-\@highpenalty}
		\addvspace{2.25em \@plus\p@}
		\begingroup
			\setlength\@tempdima{3em}
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth{
				\leavevmode
				\large \bfseries #1\hfil \hbox to\@pnumwidth{\hss #2}
			}\par
			\nobreak
			\global\@nobreaktrue
			\everypar{\global\@nobreakfalse\everypar{}}
		\endgroup
	\fi
}

\renewcommand*{\l@chapter}[2]{
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}
		\vskip 1.0em \@plus\p@
		\setlength\@tempdima{1.5em}
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode \bfseries
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			#1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par
			\penalty\@highpenalty
		\endgroup
	\fi
}

\renewcommand*{\l@section}{\@dottedtocline{1}{1.5em}{2.3em}}
\renewcommand*{\l@subsection}{\@dottedtocline{2}{3.8em}{3.2em}}
\renewcommand*{\l@subsubsection}{\@dottedtocline{3}{7.0em}{4.1em}}
\renewcommand*{\l@paragraph}{\@dottedtocline{4}{10em}{5em}}
\renewcommand*{\l@subparagraph}{\@dottedtocline{5}{12em}{6em}}

% ---
% Redefinição de estilo de partes
% ---
\renewcommand{\part}{
	\cleardoublepage
	\thispagestyle{plain}
	\@tempswafalse
	\hbox{}\vfil
	\secdef\@part\@spart
}

\def\@part[#1]#2{
	\ifnum \c@secnumdepth >-2\relax
		\refstepcounter{part}
		\addcontentsline{toc}{part}{\thepart\hspace{1em}#1}
	\else
		\addcontentsline{toc}{part}{#1}
	\fi
	\markboth{}{}{
		\centering
		\interlinepenalty \@M
		\reset@font
		\ifnum \c@secnumdepth >-2\relax
			\huge\bfseries \partname~\thepart
			\par
			\vskip 20\p@
		\fi
		\Huge \bfseries #2\par
	}
	\@endpart
}

\def\@spart#1{
	{
		\centering
		\interlinepenalty \@M
		\reset@font
		\Huge \bfseries #1\par
	}
	\@endpart
}

\def\@endpart{
	\vfil\newpage
	\if@twoside
		\hbox{}%
		\thispagestyle{empty}%
		\newpage
	\fi
	\if@tempswa
		\twocolumn
	\fi
}

% ---
% Redefinição de estilo de capítulos
% ---
\renewcommand{\chapter}[1][]{\if@openright\cleardoublepage\else\clearpage\fi
	\ifthenelse{\equal{#1}{n}}{\thispagestyle{empty}}{\thispagestyle{chapterstyle}}
	\global\@topnum\z@
	\@afterindentfalse
	\secdef\@chapter\@schapter
}

\def\@chapter[#1]#2{
	\ifnum \c@secnumdepth >\m@ne
		\refstepcounter{chapter}
		\typeout{\@chapapp\space\thechapter.}
		\addcontentsline{toc}{chapter}
		{\protect\numberline{\thechapter}#1}
	\else
		\addcontentsline{toc}{chapter}{#1}
	\fi
	\chaptermark{#1}
	\addtocontents{lof}{\protect\addvspace{10\p@}}
	\addtocontents{lot}{\protect\addvspace{10\p@}}
	\@makechapterhead{#2}
	\@afterheading
}

\def\@makechapterhead#1{
	\vspace*{50\p@}{
		\parindent \z@ \raggedright \reset@font
		\ifnum \c@secnumdepth >\m@ne
			\huge\bfseries \@chapapp{} \thechapter
			\par\nobreak
			\vskip 20\p@
		\fi
		\interlinepenalty\@M
		\Huge \bfseries #1\par\nobreak
		\vskip 40\p@
	}
}

\def\@schapter#1{\@makeschapterhead{#1}%
	\@afterheading}

\def\@makeschapterhead#1{%
	\vspace*{50\p@}%
	{\parindent \z@ \raggedright
		\reset@font
		\interlinepenalty\@M
		\Huge \bfseries  #1\par\nobreak
		\vskip 40\p@
	}
}

% ---
% Redefinição de estilo de seções
% ---
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
	{-3.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\reset@font\Large\bfseries}}

% ---
% Redefinição de estilo de subseções
% ---
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\reset@font\large\bfseries}}

% ---
% Redefinição de estilo de subsubseções
% ---
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\reset@font\normalsize\bfseries}}

% ---
% Redefinição de estilo de parágrafos
% ---
\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
	{3.25ex \@plus1ex \@minus.2ex}%
	{-1em}%
	{\reset@font\normalsize\bfseries}}

% ---
% Redefinição de estilo de subparágrafos
% ---
\renewcommand{\subparagraph}{\@startsection{subparagraph}{5}{\parindent}%
	{3.25ex \@plus1ex \@minus .2ex}%
	{-1em}%
	{\reset@font\normalsize\bfseries}}

% ---
% Definição de novo ambiente 'paisagem'
% ---
\NewEnviron{paisagem}[1][]{%
	\def\temppaisagem{\begin{landscape}\ifthenelse{\equal{#1}{c}}{\vspace*{\fill}}{}}%
			\expandafter\expandafter\expandafter\afterpage
			\expandafter\expandafter\expandafter{\expandafter\temppaisagem\BODY\ifthenelse{\equal{#1}{c}}{\vspace*{\fill}}{}\end{landscape}}%
}

% ---
% Redefinição de títulos de elementos obrigatórios do documento
% ---
\newcommand{\fichacatalograficaname}{Ficha catalogr{\'{a}}fica}
\newcommand{\listofquadrosname}{Lista de quadros}

\addto\captionsbrazil{
	\renewcommand{\listfigurename}{Lista de figuras}
	\renewcommand{\bibname}{Refer{\^{e}}ncias bibliogr{\'{a}}ficas}
}

\addto\captionsfrench{
	\renewcommand{\resumoname}{Résumé}
}

\addto\captionsspanish{
	\renewcommand{\resumoname}{Resumen}
}

% ---
% Impressão da capa
% ---
\renewenvironment{capa}{\begin{titlingpage}}{\end{titlingpage}\clearpage}
\renewcommand{\imprimircapa}{%
	\begin{capa}%
		\let\footnotesize\small
		\let\footnoterule\relax
		\noindent
		\begin{minipage}[t]{2cm}\centering\raisebox{\dimexpr\topskip-\height}%
			{\includegraphics[width=2cm]{ufcg}}
		\end{minipage}\hfill
		\begin{minipage}[t]{\textwidth-2cm}\centering
			{\large{\imprimirinstituicao}}\\
			{\large{\imprimircentro}}\\
			{\large{\imprimirprograma}}
		\end{minipage}\vfil\null%
		\begin{center}%
			{\LARGE \imprimirtitulo \par}%
			{\LARGE
				\vfil\null%
				\begin{tabular}[t]{c}%
					\imprimirautor
				\end{tabular}\par}%
			\vfil\null
			\imprimirlocal \par
			\copyright\imprimirautor, \imprimirdata \par
		\end{center}\par
	\end{capa}
}

% ---
% Impressão do conteúdo da folha de rosto
% ---
\renewcommand{\folhaderostocontent}{
	\let\footnotesize\small
	\let\footnoterule\relax
	\noindent
	\begin{minipage}[t]{2cm}\centering\raisebox{\dimexpr\topskip-\height}%
		{\includegraphics[width=2cm]{ufcg}}
	\end{minipage}\hfill
	\begin{minipage}[t]{\textwidth-2cm}\centering
		{\large{\imprimirinstituicao}}\\
		{\large{\imprimircentro}}\\
		{\large{\imprimirprograma}}
	\end{minipage}\vskip 4em%
	\begin{center}%
		{\LARGE \imprimirtitulo \par}%
		{\LARGE
			\vskip 2em%
			\begin{tabular}[t]{c}%
				\imprimirautor
			\end{tabular}\par}%
		\vskip 2em%
		\parbox[t]{122mm}{
			\manuscrito\ de \grau\ submetida \`{a} Coordenadoria do \imprimirprograma\
			da Universidade Federal de Campina Grande - Campus de Campina Grande como
			parte dos requisitos necess\'{a}rios para a obten\c{c}\~{a}o do grau de
			\Grau . \ifthenelse{\equal{\imprimirarea}{}}{}{\ \begin{center} \'{A}rea de
					Concentra\c{c}\~{a}o: \imprimirarea
			\end{center}}
		}
		\vskip 2em%
		\imprimirorientador\\Orientador \par
		\ifthenelse{\equal{\imprimircoorientador}{}}{}{\imprimircoorientador\\Orientador}
		\vfil\null
		\imprimirlocal \par
		\copyright\imprimirautor, \imprimirdata \par
	\end{center}\par
}

% ---
% Impressão de elementos pré-textuais
% ---
\newcommand{\imprimirpretextual}{
	\input{inc/\doctype.tex}
}

% ---
% Impressão da ficha catalográfica
% ---
\newcommand{\FichaCatalografica}{%
	\IfFileExists{\@currdir src/etc/fichacatalografica.tex}{
		\newpage
		\PRIVATEbookmarkthis{\fichacatalograficaname}
		\thispagestyle{empty}
		\input{src/etc/fichacatalografica.tex}
		}{\typeout{MISSING FILE: src/etc/fichacatalografica.tex}
	}
}

% ---
% Impressão da errata
% ---
\newcommand{\Errata}{%
	\IfFileExists{\@currdir src/etc/errata.tex}{
		\newpage
		\PRIVATEbookmarkthis{\errataname}
		\thispagestyle{empty}
		\centerline{\huge\bfseries \errataname}
		\par
		\medskip
		\noindent\input{src/etc/errata.tex}
		}{\typeout{MISSING FILE: src/etc/errata.tex}
	}
}

% ---
% Impressão da folha de aprovação
% ---
\newcommand{\imprimirfolhadeaprovacao}{
	\let\footnotesize\small
	\let\footnoterule\relax
	\noindent
	\begin{center}
		{\LARGE \imprimirtitulo \par}
		\vskip 3em%
		{\LARGE
			\begin{tabular}[t]{c}
				\imprimirautor
			\end{tabular}\par}
		\vskip 3em%
		{\sl \manuscrito\ de \grau\ apresentada em \imprimirdata}
		\vfil\null
		\imprimirassinaturaorientadores
		\vfil\null
		\imprimirassinaturabanca
		\vfil\null
		\imprimirlocal, \imprimirdata \par
	\end{center} \par
}

\newcommand{\FolhadeAprovacao}{%
	\IfFileExists{\@currdir src/etc/folhadeaprovacao.tex}{
		\newpage
		\PRIVATEbookmarkthis{\folhadeaprovacaoname}
		\thispagestyle{empty}
		\input{src/etc/folhadeaprovacao.tex}
		}{\typeout{MISSING FILE: src/etc/folhadeaprovacao.tex}
	}
}

% ---
% Impressão da dedicatória
% ---
\newcommand{\Dedicatoria}{%
	\IfFileExists{\@currdir src/etc/dedicatoria.tex}{
		\newpage
		\PRIVATEbookmarkthis{\dedicatorianame}
		\thispagestyle{empty}
		\centerline{\huge\bfseries \dedicatorianame}
		\par
		\medskip
		\noindent\input{src/etc/dedicatoria.tex}
	}{\typeout{MISSING FILE: src/etc/dedicatoria.tex}}
}

% ---
% Impressão da agradecimentos
% ---
\newcommand{\Agradecimentos}{%
	\IfFileExists{\@currdir src/etc/agradecimentos.tex}{
		\newpage
		\PRIVATEbookmarkthis{\agradecimentosname}
		\thispagestyle{empty}
		\centerline{\huge\bfseries \agradecimentosname}
		\par
		\medskip
		\noindent\input{src/etc/agradecimentos.tex}
	}{\typeout{MISSING FILE: src/etc/agradecimentos.tex}}
}

% ---
% Impressão da epígrafe
% ---
\newcommand{\Epigrafe}{%
	\IfFileExists{\@currdir src/etc/epigrafe.tex}{
		\newpage
		\PRIVATEbookmarkthis{\epigraphname}
		\thispagestyle{empty}
		\par
		\medskip
		\begin{epigrafe}
			\vspace*{\fill}
			\begin{flushright}
				\textit{\noindent\input{src/etc/epigrafe.tex}}
			\end{flushright}
		\end{epigrafe}
	}{\typeout{MISSING FILE: src/etc/epigrafe.tex}}
}

% ---
% Impressão do resumo em português
% ---
\newcommand{\ResumoPt}{%
	\IfFileExists{\@currdir src/etc/resumopt.tex}{
		\newpage
		\PRIVATEbookmarkthis{\resumoname}
		\thispagestyle{empty}
		\centerline{\huge\bfseries \resumoname}
		\par
		\medskip
		\noindent\input{src/etc/resumopt.tex}
	}{\typeout{MISSING FILE: src/etc/resumopt.tex}}
}

% ---
% Impressão do resumo em inglês
% ---
\newcommand{\ResumoEn}{%
	\IfFileExists{\@currdir src/etc/resumoen.tex}{
		\selectlanguage{english}
		\newpage
		\PRIVATEbookmarkthis{\resumoname}
		\thispagestyle{empty}
		\centerline{\huge\bfseries \resumoname}
		\par
		\medskip
		\noindent\input{src/etc/resumoen.tex}
		\selectlanguage{brazil}
	}{\typeout{MISSING FILE: src/etc/resumoen.tex}}
}

% ---
% Impressão do resumo em francês
% ---
\newcommand{\ResumoFr}{%
	\IfFileExists{\@currdir src/etc/resumofr.tex}{
		\selectlanguage{french}
		\newpage
		\PRIVATEbookmarkthis{\resumoname}
		\thispagestyle{empty}
		\centerline{\huge\bfseries \resumoname}
		\par
		\medskip
		\noindent\input{src/etc/resumofr.tex}
		\selectlanguage{brazil}
	}{\typeout{MISSING FILE: src/etc/resumofr.tex}}
}

% ---
% Impressão do resumo em espanhol
% ---
\newcommand{\ResumoEs}{%
\IfFileExists{\@currdir src/etc/resumoes.tex}{
		\selectlanguage{spanish}
		\newpage
		\PRIVATEbookmarkthis{\resumoname}
		\thispagestyle{empty}
		\centerline{\huge\bfseries \resumoname}
		\par
		\medskip
		\noindent\input{src/etc/resumoes.tex}
		\selectlanguage{brazil}
	}{\typeout{MISSING FILE: src/etc/resumoes.tex}}
}

% ---
% Impressão da lista de figuras
% ---
%\renewcommand{\cftfigurename}{\figurename\space} 
%\renewcommand*{\cftfigureaftersnum}{\hfill\textendash\hfill}
\renewcommand{\cftfigurename}{}
\renewcommand*{\cftfigureaftersnum}{}
\renewcommand*{\l@figure}{\@dottedtocline{1}{1.5em}{2.3em}}

\def\ListadeFiguras{\listoffigures}
\renewcommand{\listoffigures}{
	\iftotalfigures
		\PRIVATEbookmarkthis{\listfigurename}
		\chapter[n]*{\listfigurename}
		\@mkboth{\listfigurename}{\listfigurename}%
		\@starttoc{lof}%
		\clearpage
	\fi
}

% ---
% Possibilita criação de Quadros e Lista de quadros.
% Ver https://github.com/abntex/abntex2/issues/176
% ---
\newcommand{\quadroname}{Quadro}

\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}

% configurações para atender às regras da ABNT
\setfloatadjustment{quadro}{\centering}
%\renewcommand{\cftquadroname}{\quadroname\space} 
%\renewcommand*{\cftquadroaftersnum}{\hfill\textendash\hfill}
\renewcommand{\cftquadroname}{} 
\renewcommand*{\cftquadroaftersnum}{}
\renewcommand*{\l@quadro}{\@dottedtocline{1}{1.5em}{2.3em}}

\setfloatlocations{quadro}{hbtp} % Ver https://github.com/abntex/abntex2/issues/176

\newcommand{\ListadeQuadros}{
	\iftotalquadros
		\PRIVATEbookmarkthis{\listofquadrosname}
		\chapter[n]*{\listofquadrosname}
		\@mkboth{\listofquadrosname}{\listofquadrosname}%
		\@starttoc{loq}%
		\clearpage
	\fi
}

% ---
% Imprimir lista de tabelas
% ---
%\renewcommand{\cfttablename}{\tablename\space}
%\renewcommand*{\cfttableaftersnum}{\hfill\textendash\hfill}	
\renewcommand{\cfttablename}{}
\renewcommand*{\cfttableaftersnum}{}
\renewcommand*{\l@table}{\@dottedtocline{1}{1.5em}{2.3em}}

\def\ListadeTabelas{\listoftables}
\renewcommand{\listoftables}{
	\iftotaltables
		\PRIVATEbookmarkthis{\listtablename}
		\chapter[n]*{\listtablename}
		\@mkboth{\listtablename}{\listtablename}%
		\@starttoc{lot}%
		\clearpage
	\fi
}

% ---
% Enumeração de figuras, quadros e tabelas por capítulo
% ---
\counterwithin{figure}{chapter}
\counterwithin{quadro}{chapter}
\counterwithin{table}{chapter}

% ---
% Define contadores totais de figuras, quadros, tabelas e símbolos/abreviaturas
% ---
\newcounter{simbolo}
\DeclareTotalCounter{figure}
\DeclareTotalCounter{quadro}
\DeclareTotalCounter{table}
\DeclareTotalCounter{simbolo}

% ---
% Imprimir lista de símbolos e abreviaturas
% ---
\newcommand{\simbolo}{\stepcounter{simbolo}\nomenclature}
\newcommand{\abreviatura}{\stepcounter{simbolo}\nomenclature}
\renewcommand{\nomname}{Lista de s\'{\i}mbolos e abreviaturas}
\renewcommand{\pagedeclaration}[1]{\hfill\hyperlink{page.#1}{\nobreakspace#1}}
\makenomenclature
\newcommand{\ListadeSimbolos}{
	\iftotalsimbolos
		\PRIVATEbookmarkthis{\nomname}
		\@mkboth{\nomname}{\nomname}
		\printnomenclature
		\thispagestyle{empty}
		\clearpage
	\fi
}

% ---
% Imprimir sumário
% ---
\newcommand{\Sumario}{%
	\PRIVATEbookmarkthis{\contentsname}
	\chapter[n]*{\contentsname}
	\@mkboth{\contentsname}{\contentsname}
	\@starttoc{toc}
	\clearpage
}

% ---
% Imprimir introdução
% ---
\newcommand{\Introducao}{
	\IfFileExists{\@currdir src/etc/introducao.tex}{
		\chapter{Introdu\c{c}\~{a}o}
		\@mkboth{\chaptername\ \thechapter. Introdu\c{c}\~{a}o}{\chaptername\ \thechapter. Introdu\c{c}\~{a}o}
		\input{src/etc/introducao.tex}
	}{\typeout{MISSING FILE: src/etc/introducao.tex}}
}

% ---
% Imprimir conclusão
% ---
\newcommand{\Conclusao}{
	\IfFileExists{\@currdir src/etc/conclusao.tex}{
		\chapter{Conclus\~{a}o}
		\@mkboth{\chaptername\ \thechapter. Conclus\~{a}o}{\chaptername\ \thechapter. Conclus\~{a}o}
		\input{src/etc/conclusao.tex}
	}{\typeout{MISSING FILE: src/etc/conclusao.tex}}
}

% ---
% Posiciona figuras e tabelas no topo da página quando adicionadas sozinhas
% em um página em branco. Ver https://github.com/abntex/abntex2/issues/170
% ---
\makeatletter
\setlength{\@fptop}{5pt} % Set distance from top of page to first float
\makeatother

% --- 
% Espaçamentos entre linhas e parágrafos 
% ---
\setlength{\parindent}{1.3cm}	% O tamanho do parágrafo
\setlength{\parskip}{0.2cm}		% Controle do espaçamento entre um parágrafo e outro. Tente também \onelineskip

% ---
% Redefinição da espessura de \normalrulethickness
% ---
\setlength\normalrulethickness{0pt}

% ---
% Estilo de cabeçalho e rodapé da primeira página do capítulo
% ---
\copypagestyle{chapterstyle}{plain}
\makeevenhead{chapterstyle}{}{}{\thepage}
\makeoddhead{chapterstyle}{}{}{\thepage}
\makeevenfoot{chapterstyle}{}{}{}
\makeoddfoot{chapterstyle}{}{}{}