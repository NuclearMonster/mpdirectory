#!/usr/bin/perl -w

use strict;
use testlib;


Directory_SetProperty ("maxNbServers", 0);
Directory_SetProperty ("exitvalue", 1);

Test_Run ("Maximum number of servers set to zero on the command line");
