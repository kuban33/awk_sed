#!/bin/awk -f
## =================================================================================================================
##                                 ____   _____   _   _   _____   ____    ___    ____ 
##                                / ___| | ____| | \ | | | ____| |  _ \  |_ _|  / ___|
##                               | |  _  |  _|   |  \| | |  _|   | |_) |  | |  | |    
##                               | |_| | | |___  | |\  | | |___  |  _ <   | |  | |___ 
##                                \____| |_____| |_| \_| |_____| |_| \_\ |___|  \____|
##                                                                                    
## =================================================================================================================
# unheader
# ==================================================================================================================
# unheader removes specified number ( in ARGV[1] ) of header lines
#
# 1.0 - 2018-06-27 SARA
# - outputs stream without specified number of head lines
# ------------------------------------------------------------------------------------------------------------------
BEGIN {
  RS = "\n";
  FS="\"";
    
  if ( ARGC != 3 ) {
    exit(1);
  }
  if ( ARGV[1] ~ /^[0-9]+$/ ) {
    HEADERNUM=ARGV[1];
  }
  else {
    exit(1);
  }
  # reassign arguments so FILENAME = ARGV[1]
  ARGC=2;
  ARGV[1]=ARGV[2];
}
{
  if ( NR > HEADERNUM ) {
    print($0);
  }
}
END {
  exit(0);
}