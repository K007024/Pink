package Pink;

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

$obj = Pink->new("toto");
