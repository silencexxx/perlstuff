#! C:\Perl64\bin\perl.exe -w
    eval 'exec C:\Perl64\bin\perl.exe -S $0 ${1+"$@"}'
        if 0; #$running_under_some_shell

use strict;
use File::Find ();

# Set the variable $File::Find::dont_use_nlink if you're using AFS,
# since AFS cheats.

# for the convenience of &wanted calls, including -eval statements:
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted;
sub log_x;
sub usage;

&usage();

use Digest::MD5::File qw( file_md5_hex );

my ($root_dir, $debug) = @ARGV;
my %h = ();

# Traverse desired filesystems
File::Find::find({wanted => \&wanted}, $root_dir);
exit;

sub wanted {
    my ($dev,$ino,$mode,$nlink,$uid,$gid);

    if (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_)) {
		
		if (-d) {
			log_x "rem Is directory: $name";
		}
		else {

			# file

			my $md5 = file_md5_hex($_);
			log_x ("rem $md5 -> $name");

			if ($h{$md5}) {
				print "rem Exists should be deleted: $name\n";
				$name =~ s/\//\\/g;
				print "del \"$name\"\n";
			}
			else {
				$h{$md5} = $name;
			}
		}
	}
}

sub log_x {
	if ($debug && $debug eq 'd'){
		print shift;
		print "\n";
	}
}

sub usage {
	print "perl <this file> <root_dir> [d for debug]\n";
}