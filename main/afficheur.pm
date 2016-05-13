package Afficheur;

use strict;
use Data::Dumper;

sub new
{
    my $classe = shift @_;
    my $this = {};
    
    bless($this, $classe);
    return $this;
}

sub afficher
{
    my $this = shift @_;
    my %filecontent = %{shift @_};
    
    print "\nAfficheur::afficher called\n";
    
    # print join("|", sort keys(%filecontent)), "\n";
    # print Dumper \%filecontent;
    
    foreach my $element (keys %filecontent)
    {
        print $element, "\n";
        print "\t\t", $filecontent{$element}, "\n";
    }
    
}
1;