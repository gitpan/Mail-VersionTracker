use inc::Module::Install;

name('Mail-VersionTracker');
version_from('lib/Mail/VersionTracker.pm');
abstract('Parses newsletters from versiontracker.com');
author('Adam J. Foxson <afoxson@pobox.com>');
license('gpl');
requires('Mail::Internet' => '1.60');
include('ExtUtils::AutoInstall');
check_nmake();
auto_install();

&Meta->write;
&Build->write if lc($0) eq 'build.pl';
&Makefile->write if lc($0) eq 'makefile.pl';
