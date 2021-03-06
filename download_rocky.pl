use DateTime;
use LWP::Simple;

my ($date, $n, $dir) = @ARGV;
my ($y, $m, $d) = $date =~ /(\d{4})(\d{2})(\d{2})/;

sub downloadRocky {

    my $p = shift;

    my $d = DateTime->new($p->{startDate});

    for (my $i = 0; $i < $p->{numberOfDays}; $i++)	{
		my $s = sprintf "%04i%02i%02i", $d->year(), $d->month(), $d->day();
		my $toGet = "http://www.dn.se/PageFiles/73862/$s.gif";
		print "$toGet\n";
		my $data = get($toGet);
		if ((length $data) > 0) {
			open(F, ">$p->{outputDirectory}/$s.gif");
			binmode F;
			print F $data;
			close F;
		}
		$d->add(days => 1);	
    }
}


downloadRocky({
                startDate => {year => $y, 
                    month => $m, 
                    day => $d},
                numberOfDays => $n,
                outputDirectory => $dir
});
