# $Revision: 1.2 $
# $Id: Entry.pm,v 1.2 2003/12/03 02:03:50 afoxson Exp $

# Mail::VersionTracker::Entry - entry parser of versiontracker daily newsletters
# Copyright (c) 2003 Adam J. Foxson. All rights reserved.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

package Mail::VersionTracker::Entry;

use strict;
use 5.005;
use Carp;
use vars qw($VERSION $AUTOLOAD);
use Mail::VersionTracker::Utils;

local $^W = 1;

($VERSION) = '$Revision: 1.2 $' =~ /\s+(\d+\.\d+)\s+/;

sub new
{
	my $type  = shift;
	my $entry = shift or croak "I need to be passed an entry.";
	my $count = shift or croak "I need to be passed a count.";
	my $class = ref($type) || $type;
	my $self  = bless {}, $class;

	$self->{_attrs} = [
		qw(
			name_and_version name version category date description url
		)
	];

	# these are the allowed entry accessors
	$self->{_is_attr} = {map {$_ => 1} @{$self->{_attrs}}, 'full'};
	$self->_parse($entry, $count);

	return $self;
}

sub entry_keys {
	my $self = shift;
	wantarray ? @{$self->{_attrs}} : $self->{_attrs};
}

sub stringify {
	my $self = shift;
	my $string = shift;

	$string = ucfirst $string;
	$string =~ s/_/ /g;

	return $string;
}

sub _parse {
	my $self  = shift;
	my $entry = shift or croak "I need to be passed an entry.";
	my $count = shift or croak "I need to be passed a count.";
	my @entries;

	if ($entry =~ /
		^ \s* (.+) \s \( (.+) \s-\s (\d{2}\/\d{2}\/\d{4}) \) \s* $ \n
		^ \s* (.+) \s* $ \n
		^ \s* (.+) \s* $
	/mx) {
		$self->{name_and_version} = $1;
		$self->{category} = $2;
		$self->{date} = $3;
		$self->{description} = $4;
		$self->{url} = $5;
		$self->{full} = $entry;
	}
	else {
		_fatal_bug("Couldn't parse entry $count (entries).");
	}

	@$self{qw/name version/} =
		$self->_parse_entry_version($self);

	for my $key (keys %$self) {   
		if (not defined $self->{$key} or not $self->{$key}) {
			$self->{$key} = 'Not specified';
		}
	}

	return $self;
}

# TODO: One day this will probably be have to be re-written. As it is now
# it parses the very vast majority name-version's successfully, but I'd
# like to get it to 100%
sub _parse_entry_version
{
	my ($self, $entry) = @_;

	# Start of first word of version must match this
	my $version_first_word_start = qr
	/   
		(   
			[.\d]           |
			pre             |
			alpha           |
			beta            |
			patch           |
			r               |
			rel             |
			release         |
			build           |
			v(?:er)? [^a-z]
		)
	/ix;

	# Start of further words of version must match this
	my $version_other_words_start = qr
	/   
		(   
			[.\d(]          |
			pre             |
			alpha           |
			beta            |
			r               |
			rel             |
			release         |
			build           |
			patch
		)
	/ix;

	# Rest of each word of version must match this
	my $version_rest_of_word = qr
	/   
		(   
			[.\w()\/-]      |
			pre             |
			alpha           |
			beta            |
			patch           |
			\d{1,6}(?!\d)       # not more than six digits
								# in a row
		)*
	/ix;

	my ($name, $version) = ($entry->{name_and_version}, '');

	if ($entry->{name_and_version} =~
	/^  
		(.+?)                       # save name in $1
		\s+
		(                           # save version in $2
			$version_first_word_start
			$version_rest_of_word
			(?: 
				\s+
				$version_other_words_start
				$version_rest_of_word
			)*
		)                           # end saving $2
	$/ix)
	{   
		$name    = $1;
		$version = $2;
	}

	return ($name, $version);
}

sub AUTOLOAD
{
	my $self = $_[0];
	my ($package, $method) = ($AUTOLOAD =~ /(.*)::(.*)/);

	return if $method =~ /^DESTROY$/;
	unless ($self->{_is_attr}->{$method}) {
		croak "No such accessor entry: $method; aborting";
	}

	my $code = q {
		sub {   
			my $self = shift;
			return $self->{METHOD};
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
