use inc::Module::Install;
name 'Acme-JWT';
all_from 'lib/Acme/JWT.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
