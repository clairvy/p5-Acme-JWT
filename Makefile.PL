use strict;
use warnings;

BEGIN {
    my @devmods = qw(
        Module::Install::AuthorTests
        Module::Install::ReadmeFromPod
        Module::Install::Repository
    );
    my @not_available;

    {
        local *STDOUT;
        eval qq{use inc::Module::Install; 1;} or push @not_available, 'inc::Module::Install';
    }

    for my $mod (@devmods) {
        eval qq{require $mod} or push @not_available, $mod;
    }
    if (@not_available) {
        print qq{# The following modules are not available.\n};
        print qq{# `$^X $0 | cpanm` will install them:\n};
        print $_, "\n" for @not_available;
        print "\n";
        exit -1;
    }
}

use inc::Module::Install;
$Module::Install::AUTHOR = 0 if $ENV{TRAVIS};

name 'Acme-JWT';
all_from 'lib/Acme/JWT.pm';

requires 'Crypt::OpenSSL::RSA' => '0.28';
requires 'JSON' => '2.53';
requires 'MIME::Base64' => '3.13';
requires 'Try::Tiny' => '0.09';
requires 'Digest::SHA' => '5.63';

readme_from 'lib/Acme/JWT.pm';
tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More' => '0.87_01';
auto_set_repository;
auto_include;
WriteAll;
