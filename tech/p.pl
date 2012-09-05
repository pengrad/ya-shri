#!/usr/bin/env perl

use strict;
use Getopt::Long;
use Pod::Usage;

my $help;
my $message = '';
my $verbose;

@ARGV and GetOptions(
    "h" => \$help,
    "m:s" => \$message,
    "v" => \$verbose,
) or pod2usage(1);
pod2usage(-verbose => 2, -exitval => 2) if $help;

my $count = 0;

foreach my $arg (@ARGV) {
    $count++;
    if ($verbose) {
        print($arg . "\n");
    }
}

if($message ne "") {
    print($message . "\n");
}

print($count . "\n");

__END__

=head1 NAME

    printargs.pl - Print the number of arguments.

=head1 SYNOPSIS

    printargs.pl [options] [arguments]

=head1 OPTIONS

    -h      Show help message.

    -m MSG  Specify a custom message.

    -v      Print each argument.

=head1 EXAMPLE

    printargs.pl a b c

    printargs.pl -v a b c

    printargs.pl -m 'Arguments count: ' a b c

    printargs.pl -m 'Arguments count: ' -v a b c 

    printargs.pl -h
