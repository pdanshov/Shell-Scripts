#!/usr/bin/perl

use Net::FTP;

$ftp = Net::FTP->new("172.28.1.231", Debug => 0)
 or die "Cannot connect to 172.28.1.231: $@";

$ftp->login("anonymous", '-anonymous@')
 or die "Cannot login ". $ftp->message;

$ftp->cwd("/pub")
 or die "Cannot change working directory ", $ftp->message;

$ftp->get("UnixF/pricetrigger/trigger")
 or die "get failed ", $ftp->message;

$ftp->quit;


