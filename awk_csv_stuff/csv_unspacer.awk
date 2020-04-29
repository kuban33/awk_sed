#!/bin/awk -f
## =================================================================================================================
##                                 ____   _____   _   _   _____   ____    ___    ____ 
##                                / ___| | ____| | \ | | | ____| |  _ \  |_ _|  / ___|
##                               | |  _  |  _|   |  \| | |  _|   | |_) |  | |  | |    
##                               | |_| | | |___  | |\  | | |___  |  _ <   | |  | |___ 
##                                \____| |_____| |_| \_| |_____| |_| \_\ |___|  \____|
##                                                                                    
## =================================================================================================================
# unspacer
# ==================================================================================================================
# unspacer trims leading and tailing whitespace (space, tab)
#
# 1.0 - 2018-06-07 SARA
# - removes leading whitespace on line
# - removes tailing whitespace on line
# - removes leading and tailing whitespace in comma separated values
# ------------------------------------------------------------------------------------------------------------------
BEGIN {
  RS = "\n";
  FS=",";
}
{
  sub(/^[ \t]+/,"");
  gsub(/[ \t]+,/,",");
  gsub(/,[ \t]+/,",");
  sub(/[ \t]+$/,"");
  print($0);
}
END {
  exit(0);
}