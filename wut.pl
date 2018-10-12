use utf8;
open my $fh, "<:encoding(UTF-8)", @ARGV[0];
#<$fh>; # header
while (<$fh>) {
    s/^\N{BOM}// if $i++ == 0;
    my @c = split/;/;
    my $uttr = $c[51];
    if (not $uttr =~ /\d{6}/) {
        print join ":", @c;
    }
}
