package Pink;

use Afficheur;
use Lecteur;

use Cwd;

use strict;
use warnings;
use Data::Dumper;

sub new{
    my ($classe, $srcdir) = @_;
    my $this = {
        "srcdir" => getcwd(), # par default
        "fichiers" => [],
        "content" => {}, 
        "lecteur" => Lecteur->new(),
        "afficheur" => Afficheur->new()
    };
    
    
    $this->{srcdir} = $srcdir if $srcdir; # maj   
    
    bless ($this, $classe);

    $this->getfiles();
    
    return $this;
}

sub getfiles {
    my $this = shift @_;
    my @fichiers = glob($this->{srcdir} . "/*.melodymodeller");
    $this->{fichiers} = \@fichiers if @fichiers;
}

sub Lire {
    my $this = shift @_;
    my @fichiers = @{$this->{fichiers}};
    my %content;

    foreach my $fichier (@fichiers)
    {
        # my %test = ($this->{lecteur})->lire($fichier);
        # $content{$fichier} = \%test;
        
        $content{$fichier} = {($this->{lecteur})->lire($fichier)};
    }
    
    $this->{content} = \%content if %content;
    # print Dumper ($this->{content});
    
    return;
}

sub Afficher {
    my $this = shift @_;
    
    my %content = %{$this->{content}};
    print Dumper \%content;
    
    foreach my $file (keys %content)
    {
        print $file . "\n";
        my %filecontent = %{$content{$file}};
        
        # print Dumper \%filecontent;
        # print join("|", sort keys(%filecontent)), "\n";
        
        $this->{afficheur}->afficher(\%filecontent);
    }
    return;
}

 1;
 
 
 unless (caller) # eq if __name__ == '__main__':
 {
    # comment use strict;
    # my $obj = Pink->new();;
    my $obj = Pink->new("../ressources"); 
    
    $obj->Lire();
    $obj->Afficher();
    
    # use Data::Dumper;
    # print Dumper $obj;
    # print Dumper (\%record);
 }
 

