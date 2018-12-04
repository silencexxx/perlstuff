use Digest::MD5;

my ($fn) = @ARGV;

my $md5 = new Digest::MD5;
open my $f, $fn or die('ngt kukade med filen');

$md5->addfile(*$f);

close $f;

print "@{[$md5->hexdigest]}\t$fn";


