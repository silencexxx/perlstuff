chomp;
my $str = $_;

my @f = qw /entities
    context
    serviceutil
    sc\.cs/;

my $p = 1;

for (@f) {
    $p = 0 if $str =~ /$_/i;
}

print "$str\n" if $p;
