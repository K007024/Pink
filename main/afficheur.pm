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
    
    # print join("|", sort keys(%filecontent)), "\n";
    # print Dumper \%filecontent;
    
    foreach my $element (sort keys %filecontent){
        print "\n$element\n\t\t";
        print join("\n\t\t", @{$filecontent{$element}});
        
        # foreach my $item (@{$filecontent{$element}}){
            # print "\t\t$item\n";
        # }
    }
}
1;