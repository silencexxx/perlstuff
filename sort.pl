use File::Slurp qw(read_file);
my $v = read_file(@ARGV[0]);
print join("\n", sort{"\L$a" cmp "\L$b"} split"\n", $v);