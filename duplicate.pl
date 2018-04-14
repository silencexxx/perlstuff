
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

# list with 2 item array - first no, second the string
my @l = map { { count=>$d{$_}, key=>$_} } keys %d;

my @dupl = grep { $_->{'count'} > 1 } @l;

printf("Antal dubbletter: %d\n", scalar @dupl);

print join("\n", 
	map  { sprintf("%04d|%s", $_->{'count'}, $_->{'key'}) } 
	sort { $b->{'count'} <=> $a->{'count'} } 
	@dupl);


