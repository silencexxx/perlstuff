#!/usr/bin/perl -w

use strict;
use Data::Dumper;
use DBI;

my $dbh = DBI->connect ("dbi:CSV:",
                        "", "", {
			    f_dir       =>      './',
			    f_schema    =>       undef,
			    f_ext       =>      '.csv/r',
			    csv_sep_char	=>	';'
}) or die "Cannot create Database Handle: $DBI::errstr()";

my $query = $ARGV[0];

my $result = $dbh->selectall_arrayref($query);
#print Dumper($result);

print join "\n", map { join ";", @{$_} } @{$result};
print "\n";
