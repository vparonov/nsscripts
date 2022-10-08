#!/usr/bin/perl 
#how to use this script:
#for f in res/*.txt; do ./annotate.pl $f >> res/tmp_annotations; done && cat res/tmp_annotations | sort > res/annotations && rm res/tmp_annotations
use open qw( :std :encoding(UTF-8) );

$lctr = 0 ;

my ($file) = @ARGV;

open my $fh, '<:encoding(UTF-8)', $file or die "$!";
while(<$fh>) {
    $lctr++;
    
    s/\x{00FF}//g;

    if (/^([\x{0400}-\x{042F}]{2,})\s+([\x{0400}-\x{042F}]{2,})\s+([\x{0400}-\x{042F}]{2,})/)  {
        print "$2 $3\t$file\t$lctr\n" ;
    } elsif (/^([\x{0400}-\x{042F}]{2,})\s+([\x{0400}-\x{042F}]{2,})/) {
        print "$1 $2\t$file\t$lctr\n" ;
    } ;
}

close $fh;