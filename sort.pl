#use File::Slurp qw(read_file);

$/ = undef;
my $v = <>;
print join("\n", sort{"\L$a" cmp "\L$b"} split"\n", $v);

