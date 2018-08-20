#!env perl

# usage:
# echo 010101010 | perl -n  bin2hex.pl

chomp;
my @bt = split /\s+/;
for my $b (@bt){
    my @a = reverse split //, $b;
    my $i = 0;
    my $sum = 0;
    for my $ch (@a) {
#	print "$ch\n";
	$sum += 2 ** $i if $ch;
	$i++;
    }
    
    printf "bin: %s\tsum: %i\thex: 0x%x\n", $b, $sum, $sum;
}










