use utf8;

# check if 51th col is 6 numbers(date)

open my $fh, "<:encoding(UTF-8)", @ARGV[0];
#<$fh>; # header
my $good = 0;
while (<$fh>) {
    s/^\N{BOM}// if $i++ == 0;
    my @c = split/;/;
    my $uttr = $c[51];
    if (not $uttr =~ /\d{6}/) {
        print join ":", @c;
    } 
    else {
        $good++;
    }
}

print "Correct rows: $good\n";

