# $Revision: 1.10 $
# $Id: VersionTracker.pm,v 1.10 2003/12/03 02:06:08 afoxson Exp $

# Mail::VersionTracker - Parses newsletters from versiontracker.com
# Copyright (c) 2003 Adam J. Foxson. All rights reserved.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

package Mail::VersionTracker;

use strict;
use 5.005;
use Carp;
use vars qw($VERSION @ISA $AUTOLOAD);
use Mail::Internet;
use Mail::VersionTracker::Entry;
use Mail::VersionTracker::Utils;

local $^W = 1;

@ISA = qw(Mail::Internet);
($VERSION) = '$Revision: 1.10 $' =~ /\s+(\d+\.\d+)\s+/;

sub new {
	my $self = shift;
	my $parser = $self->SUPER::new(@_);

	# these are the allowed newsletter accessors
	$parser->{vt_is_attr} = {   
		map {$_ => 1} qw(   
			date details total full
		)
	};

	return $parser->_parse();
}

sub _parse {
	my $self = shift;

	$self->_parse_newsletter();
	$self->_parse_entries();

	return $self;
}

sub _parse_entries {
	my $self = shift;
	my $body = join '', @{$self->body()};
	my $count = 1;
	my @entries;

	for my $entry (split /$blank_line/m, $self->details()) {
		my $new_entry = Mail::VersionTracker::Entry->new($entry, $count);

		push @entries, $new_entry;
		$count++;
	}

	$self->{vt_total} = scalar @entries;
	$self->{vt_entries} = \@entries;
}

sub _parse_newsletter {
	my $self = shift;
	my $body = join '', @{$self->body()};

	$body =~ s/\xA9/\(C\)/;
	$body =~ tr[\x92][]d;
	$body =~ s/\n{2,}/\n\n/g;

	$body =~
	m!
		.*
		$blank_line
		^ -{31} \s* $ \n
		^ ( \w{3} \s \w{3} \s \d{1,2}, \s \d{4} ) \s* $ \n
		$blank_line
		((?s:.+?))
		$blank_line
		^ (?:=\-){9} \s Special\ Advertisement\ Section \s (?:\-=){11} -? \s* $ \n
		.*
	!mxi or _fatal_bug("Couldn't parse newsletter structure (body).");

	$self->{vt_date} = $1;
	$self->{vt_details} = $2;
	$self->{vt_full} = $body;

	chomp $self->{vt_details};
}

sub entries {
	my $self = shift;

	croak "entries is not a class method" if not ref $self;

	wantarray ? @{$self->{vt_entries}} : $self->{vt_entries};
}

sub AUTOLOAD {
	my $self = $_[0];
	my ($package, $method) = ($AUTOLOAD =~ /(.*)::(.*)/);

	return if $method =~ /^DESTROY$/;

	croak "$method is not a class method or does not exist" if not ref $self;

	unless ($self->{vt_is_attr}->{$method}) {   
		croak "No such newsletter accessor: $method; aborting";
	}

	my $code = q{
		sub{   
			my $self = shift;
			return $self->{vt_METHOD};
		}
	};

	$code =~ s/METHOD/$method/g;

	{
		no strict 'refs';
		*$AUTOLOAD = eval $code;
	}

	goto &$AUTOLOAD;
}

1;
