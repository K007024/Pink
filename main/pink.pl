use Pink;

print "--begin\n";

my $obj1 = Pink->new("toto") and print "1 - instance OK\n";

print "2 - srcdir ";
($obj1->{"srcdir"} ne "") ? print "OK\n" : print "NOT init\n";






print "\n--end";