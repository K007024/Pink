package Pink;

use strict;

sub new{
    my ($classe, $srcdir) = @_;
    my $this = {
        "srcdir" => "", # par default
        "filepath" => "",
        "exigences" => []
    };
    
    $this->{"srcdir"} = $srcdir if $srcdir; # maj
    
    bless ($this, $classe);
    return $this;
}

 1;
 
# $obj = Pink->new("toto"); # comment use strict;
