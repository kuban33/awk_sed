#!/bin/awk -f
## =================================================================================================================
##                                 ____   _____   _   _   _____   ____    ___    ____ 
##                                / ___| | ____| | \ | | | ____| |  _ \  |_ _|  / ___|
##                               | |  _  |  _|   |  \| | |  _|   | |_) |  | |  | |    
##                               | |_| | | |___  | |\  | | |___  |  _ <   | |  | |___ 
##                                \____| |_____| |_| \_| |_____| |_| \_\ |___|  \____|
##                                                                                    
## =================================================================================================================
# unquoter
# ==================================================================================================================
# unquoter to remove additional csv support for quotes and quoted comma, this is to make basic csv that will be
# again quoted (quoter) for solid loading with WTF damned loaders
#
# 1.0 - 2018-05-30 SARA
# - removes double quotes that should represent single quote in quoted csv word
# - removes quoted commas
# - removes quotes and keep simple csv, awaiting in next step to quote all words
# - outputs stream
# ------------------------------------------------------------------------------------------------------------------
BEGIN {
  RS = "\n";
  FS="\"";
}
/""/ {
  gsub(/""/,"");
}
/".*,.*"/ {
  if ( NF%2 == 1 ) {
    NEWZERO="";
    for (i=1; i<=NF; i++) {
      if ( i%2 == 0 ) {
        gsub(/,/,"",$i);
      }
      NEWZERO=NEWZERO""$i;
    }
    $0=NEWZERO;
  }
}
{
  gsub(/"/,"");
  print($0);
}
END {
  exit(0);
}