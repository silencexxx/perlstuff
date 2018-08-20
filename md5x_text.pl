use Digest::MD5;

local $/ = undef;
my $t = <>;

my $md5 = new Digest::MD5;

$md5->add($t);

print "@{[$md5->hexdigest]}\t$t";


