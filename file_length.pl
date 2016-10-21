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

my @o = ();

# Traverse desired filesystems
File::Find::find({wanted => \&wanted}, './');

print(join("\n", map {
	length($_) . "\t$_"
} sort {
	return length($b) <=> length($a)
} @o));

exit;

sub wanted {
    my ($dev,$ino,$mode,$nlink,$uid,$gid);

    if (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_)) {
		#print(length($name) . "$name\n");
		push(@o, $name);
	}
}

