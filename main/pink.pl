sub constructeur
{
    my ($classe) = @_;
    my $this = {};
    bless ($this, $classe);
    return $this;
}