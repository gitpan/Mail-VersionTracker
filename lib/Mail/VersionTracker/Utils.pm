# $Revision: 1.1.1.1 $
# $Id: Utils.pm,v 1.1.1.1 2003/12/03 01:26:02 afoxson Exp $

# Mail::VersionTracker::Utils - support class that exports utilities
# Copyright (c) 2003 Adam J. Foxson. All rights reserved.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

package Mail::VersionTracker::Utils;

use strict;
use 5.005;
use Carp;
use Exporter;
use vars qw(@ISA $VERSION @EXPORT $blank_line);

local $^W = 1;

($VERSION) = '$Revision: 1.1.1.1 $' =~ /\s+(\d+\.\d+)\s+/;
@ISA = qw(Exporter);
@EXPORT = qw(&_fatal_bug $blank_line);
$blank_line  = qr/ ^ \s * $ \n /x;

sub _fatal_bug {
	my $error = <<'EOF';

Please contact the author of Mail::VersionTracker at <afoxson@pobox.com>
if you believe that the module has failed to parse a genuine freshmeat
newsletter.

The above error occurred
EOF

	chop $error;
	croak +(join '', @_) . "\n" . $error;
}

1;
