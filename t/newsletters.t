#!/usr/bin/perl -w

use strict;
use Test;
use Mail::VersionTracker;

BEGIN { plan test => 5402 }

for my $file ('t/macosx', 't/palmos') {
	my $count = -1;
	my @newsletters;

	open FM, $file or die $!;
	while (<FM>) {
		$count++ if /^From\s/;
		push @{$newsletters[$count]}, $_;
	}
	close FM or die $!;

	my $start_count = ++$count;

	$count = 0;
	for my $newsletter (@newsletters) {
		$count++;
		my $letter;
		eval { $letter = Mail::VersionTracker->new($newsletter) };

		ok(not $@);
		next if $@;

		ok($letter->date(), qr/\w{3}\s\w{3}\s\d{1,2},\s\d{4}/);
		ok($letter->total(), qr/\d+/);
		ok(ref $letter->entries(), 'ARRAY');

		for my $entry ($letter->entries()) {
			ok((join '', @{$entry->entry_keys}),
				'name_and_versionnameversioncategorydatedescriptionurl');
			ok($entry->name_and_version(), qr/${\(quotemeta($entry->name()))}/);
			ok($entry->name());
			ok($entry->version());
			ok($entry->category(), qr/^\w+$/);
			ok($entry->date(), qr/\d+\/\d+\/\d+/);
			ok($entry->description());
			ok($entry->url(), qr/^http:\/\//);
		}
	}

	ok($count == $start_count);
}
