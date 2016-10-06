#! C:\Perl64\bin\perl.exe -w
    eval 'exec C:\Perl64\bin\perl.exe -S $0 ${1+"$@"}'
        if 0; #$running_under_some_shell


# print all the bellator verions in this folder and sub folders
# really usefull

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


my @files = ();

# Traverse desired filesystems
File::Find::find({wanted => \&wanted}, './');

my @versions = sort grep { /\d+/ } map {
    /bellator\D*(\d+)/i ? $1 : 'IGNORE ME';
} @files;

print "\n----versions---\n";
print join("\n", @versions);

exit;


sub wanted {
    my ($dev,$ino,$mode,$nlink,$uid,$gid);

    if ((($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_)) && /^.*bellator.*\z/si) {
        print("$name\n");
        push(@files, $name);
    }
}


