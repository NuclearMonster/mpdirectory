#!/usr/bin/perl -w

use strict;
use testlib;


Directory_SetProperty ("extraOptions", [ "-v" ]);
Test_Run ("No parameter associated with the verbose command line option");
