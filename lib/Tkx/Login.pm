$Tkx::Login::VERSION='VERSIONTAG';

use Tkx;
use strict;

package Tkx::Login;

sub askpass {
  my $gotpass = 0;

  my $mw = shift @_;
  my $user = shift @_;
  my $pass = shift @_;

  my $win = $mw->new_toplevel();
  $win->g_wm_title("Login");

  my $label = $win->new_ttk__label(-text => "Please enter Username and Password for ASUP." );
  $label->g_grid;

  $win->new_ttk__label(-text => "Username:" )->g_grid;

  my $name_entry = $win->new_ttk__entry(-textvariable => \$user);
  $name_entry->g_grid;

  $win->new_ttk__label(-text => "Password:" )->g_grid;

  my $pass_entry = $win->new_ttk__entry(-textvariable => \$pass, -show => '*');
  $pass_entry->g_grid;

  my $ok = $win->new_button(
    -text => 'Ok',
    -command => sub {
       #message("Got: ".$name_entry->get );
       $gotpass++;
       $win->g_destroy;
    },
  );
  $ok->g_grid;

  while ( $gotpass < 1 ) {
    Tkx::update();
  }

  return ( $user, $pass );
}

1;