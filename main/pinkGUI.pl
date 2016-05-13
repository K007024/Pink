package PinkGUI;

use strict;
use Pink;
use Tkx;

sub new()
{
    my $classe = shift @_;
    my $this = {
    "pink" => "", 
    "srcdir" => ""};
    
    bless($this, $classe);
    
    $this->build();
    return $this;
}

sub build
{
    my $this = shift @_;
    
    Tkx::wm_title(".", "PinkGUI");
 
    Tkx::ttk__label(".source_lb", -text => "Source");
    Tkx::grid(".source_lb", -column => 1, -row => 1, -sticky => "we");
    
    Tkx::ttk__entry(".source_e", -width => 70, -textvariable => \$this->{srcdir});
    Tkx::grid(".source_e", -column => 2, -row => 1, -sticky => "we");
    
    Tkx::ttk__button(".open", -text => "Open", -command => sub {$this->open();});
    Tkx::grid(".open", -column => 3, -row => 1, -sticky => "we");    
    
    Tkx::ttk__button(".read", -text => "Read", -command => sub {$this->read();});
    Tkx::grid(".read", -column => 3, -row => 2, -sticky => "we");  
    
    Tkx::ttk__button(".disp", -text => "Display", -command => sub {$this->disp();});
    Tkx::grid(".disp", -column => 3, -row => 3, -sticky => "we");
    
    Tkx::MainLoop();
}



sub open
{
    my $this = shift @_;
    my $dirname = Tkx::tk___chooseDirectory(-title => 'Open model directory');
    if (-d $dirname) 
    {
        print $dirname;
        $this->{srcdir} = $dirname;
        $this->{pink} = Pink->new($dirname);
    }
}

sub read
{
    my $this = shift @_;
    print $this->{pink}->lire();
}

sub disp
{
    my $this = shift @_;
    print $this->{pink}->afficher();
}

1;

 unless (caller) # eq if __name__ == '__main__':
 {
    my $obj = PinkGUI->new(); 
 }