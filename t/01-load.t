use Test;
use strict;

BEGIN { plan tests => 2 };

use Tkx::Login;
ok(1); 

my $t = new Tkx::Login;
ok(defined $t);

