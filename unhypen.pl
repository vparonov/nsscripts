#!/usr/bin/perl 

#for f in *.txt; do ./unhypen.pl $f > res/"un_"$f; done
my $linewidth = 80 * 2;
my $currentParagraph = "" ;

while(<>) {
    chomp;
    s/\x{00FF}//g;

    if ($_ eq "") {
        wrap_and_print($currentParagraph);
        $currentParagraph = "";
    }

    if (/\-$/) {
        chop;
        $currentParagraph .= $_ ;
    } else {
        $currentParagraph .= $_ ;
        $currentParagraph .= " " ;
    }
}

wrap_and_print($currentParagraph);

sub wrap_and_print() {
    my $text = shift;

    $text =~ s/(?:.{1,$linewidth}\S|\S+)\K\s+/\n/g;  
    $text =~ s/^\s+//;
    $text =~ s/\s+$//;
    print $text,"\n\n";
}