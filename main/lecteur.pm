package Lecteur;

use strict;

sub new
{
    my $classe = shift @_;
    my $this = {};
    
    bless($this, $classe);
    return $this;
}

sub lire
{
    my $this = shift @_;
    my $filepath = shift @_;
    
    print "Lecteur::lire called\n";
    
    # read files
    
    # debug
    my %content = (
        "Actors" => "TBD", 
        "Operational Activities" => "TBD"
    );
    
    return %content;
}

1;