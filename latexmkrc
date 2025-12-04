#!/usr/bin/env perl

$latex    = 'uplatex -synctex=1 -halt-on-error';
$latex_silent = 'platex -synctex=1 -halt-on-error -interaction=batchmode';
$uplatex  = 'uplatex %O -synctex=1 -interaction=nonstopmode %S';
$pdflatex = 'pdflatex %O -synctex=1 -interaction=nonstopmode %S';
$lualatex = 'lualatex %O -synctex=1 -interaction=nonstopmode -file-line-error %S';
$xelatex  = 'xelatex %O -no-pdf -synctex=1 -shell-escape -interaction=nonstopmode %S';

#$bibtex        = 'pbibtex';
$bibtex        = 'upbibtex %O %B';
$biber         = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$dvipdf        = 'dvipdfmx %O -o %D %S';
#$makeindex     = 'mendex %O -o %D %S';
$makeindex     = 'upmendex %O -o %D %S';
$max_repeat    = 5; # Build 5 times in 1 pass
$pdf_mode      = 3; # Generates pdf via dvipdfmx

if ($^O eq 'darwin') {
  $pvc_view_file_via_temporary = 0;
  $pdf_previewer = 'open -ga /Applications/Skim.app';
} elsif ($^O eq 'linux') {
  $pdf_previewer = 'evince';
}
