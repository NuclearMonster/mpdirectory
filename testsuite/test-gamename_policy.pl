#!/usr/bin/perl -w

use strict;
use testlib;


for (my $i = 0; $i < 4; $i++) {
	my $gameName = "mpdirectoryTest" . ($i + 1);

	# Create the server
	my $serverRef = Server_New ();
	Server_SetProperty ($serverRef, "id", $gameName);
	Server_SetGameProperty ($serverRef, "gamename", $gameName);

	# Create the associated client
	my $clientRef = Client_New ();
	Client_SetGameProperty ($clientRef, "gamename", $gameName);
}


my %gamePolicy = (
	policy => "accept",
	gamenames => [
		"mpdirectoryTest1",
		"mpdirectoryTest2",
		"mpdirectoryTest5",
		"mpdirectoryTest6",
	],
);
Directory_SetProperty ("gamePolicy", \%gamePolicy);
Test_Run ("Game policy using \"accept\"");


%gamePolicy = (
	policy => "reject",
	gamenames => [
		"mpdirectoryTest1",
		"mpdirectoryTest2",
		"mpdirectoryTest5",
		"mpdirectoryTest6",
	],
);
Directory_SetProperty ("gamePolicy", \%gamePolicy);
Test_Run ("Game policy using \"reject\"");

