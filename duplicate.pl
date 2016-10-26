
#
# print all duplicate lines. 
# output is
#  <number of duplicate>:<the row>
# sorted by the most duplicate first
#

open my $f, "<", @ARGV[0];

my %d = ();

while (<$f>){
	chomp;
	if ($d{$_}) {
#		print "Duplicate: $_\n";
		$d{$_}++;
	}
	else {
		 $d{$_} = 1;
	}
}

my @l = ();

foreach my $k (keys %d) {
	push @l, [$d{$k}, $k]; # list with 2 item array - first no, second the string
	#print "$d{$k}\t$k\n";
}

print join("\n", 
	map {$_->[0] . ":" . $_->[1]} 
	sort {$b->[0] <=> $a->[0]} 
	grep {$_->[0] > 1}
	@l);


