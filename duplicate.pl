
#
# print all duplicate lines. 
# output is
#  <number of duplicate>:<the row>
# sorted by the most duplicate first
#

my %d = ();

while (<>){
	chomp;
	$d{$_}++;
}

my @l = ();

# list with 2 item array - first no, second the string
@l = map {[$d{$_}, $_]} keys %d;

print join("\n", 
	map {sprintf("%04d,%s",$_->[0],$_->[1])} 
	sort {$b->[0] <=> $a->[0]} 
	#grep {$_->[0] > 1}
	@l);


