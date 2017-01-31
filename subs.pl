sub be {
    my $data = shift;
    return sub {
        my ($begin, $end) = @_;
        my $skip = $begin - 1;
        my $n = $end - $begin + 1;
        print "$skip\t$n\n";
        $data =~ /.{$skip}(.{$n})/;
        return $1;    
    };
}

my $row = '01100119711101-1234';

my $o = be($row);

# begin index, end index.
# first position is "1" (not "0")

print &$o(7, 14);
print &$o(3, 4);
