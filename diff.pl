
# shows rows in file1 that doesn't exist in file2
# 

print "diff\n";

my $f1 = @ARGV[0];
my $f2 = @ARGV[1];

my %d_a = g($f1);
my %d_b = g($f2);

for my $x (keys(%d_a)) {
	if (!$d_b{$x}) {
		print "$x\n";
	}
}

sub g {
	my $filename = shift;
	open(my $f, "<", $filename) or die("could not open file ($filename)!");

	my %ret = ();
	while (<$f>) {
		chomp;		
		$ret{$_} = true;	
	}
	
	close $f;
	return %ret;
}

