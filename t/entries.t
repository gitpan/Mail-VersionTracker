#!/usr/bin/perl -w

use strict;
use Test;
use Mail::VersionTracker;

BEGIN { plan tests => 4 }

open LETTER, "t/macosx" or die $!;
my $newsletter = Mail::VersionTracker->new(\*LETTER);
close LETTER or die $!;

ok(ref $newsletter, 'Mail::VersionTracker');
ok($newsletter->date(), 'Thu Nov 20, 2003');

my $details = <<EOF;
Nisus Writer Express 1.1 (Commercial - 11/20/2003)
Word processor/outliner with custom interface
http://www.versiontracker.com/dyn/moreinfo/mac/19296

SmartSplitter 1.2.1 (Freeware - 11/20/2003)
open-source control splitter class for REALbasic 5
http://www.versiontracker.com/dyn/moreinfo/mac/21589

My Calendar 10.8 (Shareware - 11/20/2003)
Calendar creator with notes, banners, graphics...
http://www.versiontracker.com/dyn/moreinfo/mac/15855

Renamer4Mac 2.0 (Freeware - 11/20/2003)
Renames files in batches to a preset pattern
http://www.versiontracker.com/dyn/moreinfo/mac/17205

MisFox 1.2 (Freeware - 11/20/2003)
(Missing Internet Settings for X) gui for hidden net settings
http://www.versiontracker.com/dyn/moreinfo/mac/18530

DEVONagent 1.1 (Shareware - 11/20/2003)
Intelligent agent to find info on the Internet
http://www.versiontracker.com/dyn/moreinfo/mac/20725

Click'n View 1.0i (Shareware - 11/20/2003)
image viewer: import, print, convert and more
http://www.versiontracker.com/dyn/moreinfo/mac/21147

DVDRemaster 1.2 (Shareware - 11/20/2003)
Recompresses DVDs to fit on standard DVD5
http://www.versiontracker.com/dyn/moreinfo/mac/20778

Solitaire Till Dawn X 1.2.1 (Shareware - 11/20/2003)
65 different solitaire card games
http://www.versiontracker.com/dyn/moreinfo/mac/16143

AppleCore Project 0.5/0.5 (Shareware - 11/20/2003)
20+ lean and mean tools for power users
http://www.versiontracker.com/dyn/moreinfo/mac/19692

Greppie 1.0b3 (Beta - 11/20/2003)
A graphical user interface for UNIX grep
http://www.versiontracker.com/dyn/moreinfo/mac/21607

QTViewer 1.4.1 (Shareware - 11/20/2003)
Quicktime movie viewer with more features
http://www.versiontracker.com/dyn/moreinfo/mac/20511

MacBusiness 1.0b1 (Shareware - 11/20/2003)
project time tracker/invoicing for small biz
http://www.versiontracker.com/dyn/moreinfo/mac/21614

GPSNavX 1.65 (Shareware - 11/20/2003)
GPS & charting application
http://www.versiontracker.com/dyn/moreinfo/mac/20362

Aquallegro 2.0 (Freeware - 11/20/2003)
Music theory teaching software
http://www.versiontracker.com/dyn/moreinfo/mac/21539

Platypus 1.8 (Freeware - 11/20/2003)
Creates Mac OS X applications from scripts
http://www.versiontracker.com/dyn/moreinfo/mac/19870

MacXM 1.21 (Freeware - 11/20/2003)
XMPCR control program
http://www.versiontracker.com/dyn/moreinfo/mac/20899

jSearch 1.0.1 (Shareware - 11/20/2003)
menu bar search tools
http://www.versiontracker.com/dyn/moreinfo/mac/21547

Alarm Clock Pro 6.3.3 (Shareware - 11/20/2003)
MP3 alarm clock; iTunes, net streaming, cron-like
http://www.versiontracker.com/dyn/moreinfo/mac/13639

VersionTracker Pro X 3.0 (Update - 11/20/2003)
Desktop app finds, downloads, installs updates to your software
http://www.versiontracker.com/dyn/moreinfo/mac/10230

Color Bar GUI Widget 3.0.2 (Shareware - 11/20/2003)
adds 3D color bars w/anti-aliased text
http://www.versiontracker.com/dyn/moreinfo/mac/15222

iChart 0.1.2b4 (Beta - 11/20/2003)
manage your sequence and collection of charts
http://www.versiontracker.com/dyn/moreinfo/mac/20993

ScreenShot Plus 1.1.2 (Shareware - 11/20/2003)
scale & pick format using Apple's screen capture
http://www.versiontracker.com/dyn/moreinfo/mac/19376

Advanced Team Scheduler X 7.5.3 (Shareware - 11/20/2003)
complete sports scheduling system
http://www.versiontracker.com/dyn/moreinfo/mac/13326

Studycard Studio Lite 2.0.1 (Freeware - 11/20/2003)
create & memorize multimedia flashcards
http://www.versiontracker.com/dyn/moreinfo/mac/18658

VoiceNoteMenu 1.5 (Shareware - 11/20/2003)
voice note recorder in the menu bar
http://www.versiontracker.com/dyn/moreinfo/mac/21452

CloakIt 2.0 (Shareware - 11/20/2003)
makes folders invisible/visible with password protection
http://www.versiontracker.com/dyn/moreinfo/mac/17924

MacPipes X 1.1.2 (Shareware - 11/20/2003)
Puzzle game: build a pipeline of required length
http://www.versiontracker.com/dyn/moreinfo/mac/15475

wClock 3.0 (Freeware - 11/20/2003)
menu bar clock with date, time & calendar
http://www.versiontracker.com/dyn/moreinfo/mac/7766

iBlog 1.3.4 (Shareware - 11/20/2003)
desktop weblogging app with iLife integration
http://www.versiontracker.com/dyn/moreinfo/mac/16846

Tiger Woods 2003 1.1 (Update - 11/20/2003)
PGA golf simulator game
http://www.versiontracker.com/dyn/moreinfo/mac/20011

Sweet MIDI Player 2.0.7 (Shareware - 11/20/2003)
MIDI player with jukebox function
http://www.versiontracker.com/dyn/moreinfo/mac/12622

Amazing Slow Downer 2.6.3 (Shareware - 11/20/2003)
Slows down music w/o changing its pitch
http://www.versiontracker.com/dyn/moreinfo/mac/12457

WebDesktop 2.1 (Freeware - 11/20/2003)
overlays a fully functional web browser on the desktop
http://www.versiontracker.com/dyn/moreinfo/mac/17536

Age of Mythology 1.0 (Commercial - 11/20/2003)
real-time strategy game
http://www.versiontracker.com/dyn/moreinfo/mac/21611

4D WebSTAR V 5.3.2 (Update - 11/20/2003)
server software suite
http://www.versiontracker.com/dyn/moreinfo/mac/11438

Doulber Gold 1.2 (Shareware - 11/20/2003)
team up with a bug and dig for diamonds game
http://www.versiontracker.com/dyn/moreinfo/mac/20869

TelnetLauncher 2.6.7 (Shareware - 11/20/2003)
launcher for OS X's built-in Telnet & SSH clients
http://www.versiontracker.com/dyn/moreinfo/mac/9201

Painter's Picker 1.0.2 (Shareware - 11/20/2003)
an even easier color picker
http://www.versiontracker.com/dyn/moreinfo/mac/21252

ViewRemote 2.1.6 (Commercial - 11/20/2003)
Secretly record your Mac; watch from anywhere
http://www.versiontracker.com/dyn/moreinfo/mac/21610

Aladdin Internet Cleanup 1.1 (Update - 11/20/2003)
helps remove spyware & erase data trails
http://www.versiontracker.com/dyn/moreinfo/mac/19900

Default Folder X 1.9.2 (Shareware - 11/20/2003)
enhancement for open/save dialog boxes
http://www.versiontracker.com/dyn/moreinfo/mac/13660

Eigenmath 37 (Freeware - 11/20/2003)
computer algebra with graphical math display
http://www.versiontracker.com/dyn/moreinfo/mac/20616

K2  KeyAuditor/Server 6.0.0.5 (Update - 11/20/2003)
software auditing/license management
http://www.versiontracker.com/dyn/moreinfo/mac/2326

TechRTA 1.2 (Shareware - 11/20/2003)
realtime analyzer visual plug-in for iTunes
http://www.versiontracker.com/dyn/moreinfo/mac/13063

ConverTable Planets 1.6.1 (Freeware - 11/20/2003)
compare weights on planets & moons
http://www.versiontracker.com/dyn/moreinfo/mac/13234

SnapNDrag 1.2.8 (Freeware - 11/20/2003)
screen capture utility
http://www.versiontracker.com/dyn/moreinfo/mac/19919

Myriad Music Plug-In 4.0 (Freeware - 11/20/2003)
build Web pages that play Harmony/Melody files
http://www.versiontracker.com/dyn/moreinfo/mac/10465

Melody Player 3.3 (Freeware - 11/20/2003)
music list player
http://www.versiontracker.com/dyn/moreinfo/mac/10056

Harmony Assistant 8.4.0 (Shareware - 11/20/2003)
complete arranger and score editor
http://www.versiontracker.com/dyn/moreinfo/mac/7558

Melody Assistant 6.4.0 (Shareware - 11/20/2003)
helps write & compose music, midi, karaoke
http://www.versiontracker.com/dyn/moreinfo/mac/2826

Compositor 2.5.3 (Shareware - 11/20/2003)
Image editor & image to art creator with 165+ effects
http://www.versiontracker.com/dyn/moreinfo/mac/20585

DragThing 5.0.1 (Shareware - 11/20/2003)
launcher palette for files, folders, disks, servers, URLs
http://www.versiontracker.com/dyn/moreinfo/mac/21229

NotePad 1.5.1 (Freeware - 11/20/2003)
note pad app like the OS 9 Desk Accessory
http://www.versiontracker.com/dyn/moreinfo/mac/20548

Emagic Logic Audio Platinum 6.3.2 (Update - 11/20/2003)
MIDI & digital audio sequencer
http://www.versiontracker.com/dyn/moreinfo/mac/8038

Romi 3.2 (Shareware - 11/20/2003)
rummy tile, rummycube, rummikub, rami, card game
http://www.versiontracker.com/dyn/moreinfo/mac/13395

Mac Sweeper 1.8 (Freeware - 11/20/2003)
System optimizer
http://www.versiontracker.com/dyn/moreinfo/mac/21484

LinkLines 1.0.4 (Shareware - 11/20/2003)
classic Lines arcade puzzle game
http://www.versiontracker.com/dyn/moreinfo/mac/20069

FaxEmailHelper 1.1.3 (Freeware - 11/20/2003)
enhances fax forwarding by email in Panther
http://www.versiontracker.com/dyn/moreinfo/mac/21548

Browse Volumes Lite 1.3.3 (Shareware - 11/20/2003)
browse entire disks from CM & menu bar
http://www.versiontracker.com/dyn/moreinfo/mac/16280

Xpublish 1.1.7 (Shareware - 11/20/2003)
1 click html publishing supports unlimited sites & entries
http://www.versiontracker.com/dyn/moreinfo/mac/20660

Image Info Toolkit 1.5 (Shareware - 11/20/2003)
Edit IPTC text info in JPEG images
http://www.versiontracker.com/dyn/moreinfo/mac/18313

FileMaker Database Calendar 2.0 (Shareware - 11/20/2003)
FileMaker calendar
http://www.versiontracker.com/dyn/moreinfo/mac/21609

DigitizeIt 1.5.6 (Shareware - 11/20/2003)
auto digitize scanned graphs & output data values
http://www.versiontracker.com/dyn/moreinfo/mac/18833

TH-S 2.5.1 (Commercial - 11/20/2003)
multichannel multiplayer cue playback system
http://www.versiontracker.com/dyn/moreinfo/mac/16174

PTK 1.26 (Shareware - 11/20/2003)
multiplatform game library
http://www.versiontracker.com/dyn/moreinfo/mac/20644

Miraizon Cinematize 1.02 (Update - 11/20/2003)
DVD segment extraction tool
http://www.versiontracker.com/dyn/moreinfo/mac/20604

Capture One 3.1 (Update - 11/20/2003)
RAW file converter for pro photographers
http://www.versiontracker.com/dyn/moreinfo/mac/20352

C1 PRO 1.2.1 (Update - 11/20/2003)
RAW file converter for pro photographers
http://www.versiontracker.com/dyn/moreinfo/mac/18617
EOF

chomp $details;

ok($newsletter->details(), $details);
ok($newsletter->total(), 69);
