use utf8;
open my $fh, "<:encoding(UTF-8)", @ARGV[0];
my $fr = <$fh>;
chomp $fr;
$fr =~ s/^\N{BOM}//; # remove bom-mark
#print $fr;
my @c = split(';', $fr);
print map { 
    "$_->[0] : $_->[1]\n"
} map { 
    [$i++, $_] 
}  @c;
