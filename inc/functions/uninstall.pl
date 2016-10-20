#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## ALISAM TECHNOLOGY 2015
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## DELETE / UNINSTALL TOOL
sub is_folder_empty {
  my $dirname = shift;
  opendir(my $dh, $dirname);
  return scalar(grep { $_ ne "." && $_ ne ".." } readdir($dh)) == 0;
}    
## 
our ($uninstall, $scriptbash, $script, $scriptCompletion, @TT, @c, @OTHERS, @DT);
if (defined $uninstall) {
  desclaimer();
  print $c[2]."$OTHERS[8]";
  print $c[10];
  my $resp=<STDIN>;
  chomp ($resp);
  if ($resp=~/(Y|y)/) {
    print $c[4]."[!] $DT[31]\n";
    unlink $scriptbash if -e $scriptbash;
    unlink "$scriptCompletion/atscan" if -e "$scriptCompletion/atscan";
    system "rm -rf $Bin/inc" if -e "$Bin/inc";
    system "rm $Bin/atscan.pl" if -e "$Bin/atscan.pl";
    system "rm $Bin/atscan" if -e "$Bin/atscan";
    system "rm $Bin/usr/share/doc/atscan/README.md" if -e "$Bin/usr/share/doc/atscan/README.md";
    if (is_folder_empty($Bin)) {
      system "rm -rf $Bin";
    }   
    sleep(3);
    print $c[3]."$OTHERS[9]\n";
  }else{
    system("perl $script --updtd || atscan --updtd ");
    mtak(); ptak();
    print $c[4]."[!] $TT[13]\n";
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
1;
######################################################################################################################################################################################################
######################################################################################################################################################################################################
