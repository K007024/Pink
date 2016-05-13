package Lecteur;

use XML::LibXML;
use strict;
use Data::Dumper;

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

    my $parser = XML::LibXML->new();
    my $root = ($parser->parse_file($filepath))->getDocumentElement;
    
    # Actors
    my @acteurs;
    foreach my $actor ($root->getElementsByTagName('ownedActors')) 
    {
        my $name = $actor->getAttribute("name");
        push @acteurs, $name;
    }
    
    # fonctions
    my @fonctions;
    my @ownedOperationalActivities = $root->getElementsByTagName('ownedOperationalActivities');
    foreach my $ownedOperationalActivity (@ownedOperationalActivities) {
        foreach my $fonction ($ownedOperationalActivity->getElementsByTagName('ownedFunctions')) {
            my $name = $fonction->getAttribute("name");
            push @fonctions, $name;
        }
    }
    
    my %content;
    $content{"Actors"} = [@acteurs];
    $content{"Operational Activities"} = [@fonctions];
    # print Dumper \%content;
    
    return %content;
}
1;