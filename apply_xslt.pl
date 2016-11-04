# apply xslt

use File::Slurp qw/read_file/;
use XML::XSLT;

my $xml_data = read_file(@ARGV[0]);
my $xslt_data = read_file(@ARGV[1]);

my $xslt = XML::XSLT->new ($xslt_data, warnings => 1);

$xslt->transform ($xml_data);
print $xslt->toString;

$xslt->dispose();
