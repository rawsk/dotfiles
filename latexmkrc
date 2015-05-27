#!/usr/bin/env perl
$latex            = 'platex -synctex=1 -halt-on-error';
$latex_silent     = 'platex -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex           = 'pbibtex';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$clean_ext  	  = 'synctex.gz bbl';
$max_repeat       = 5;
$pdf_mode	  = 3;
#$pdf_previewer    = 'open -ga Preview';
$pdf_previewer    = 'open -a Preview';
$pdf_update_method = 4;
$pdf_update_command = 'open -a Preview;open -a Sublime\ Text';
#$pvc_view_file_via_temporary = 0;
