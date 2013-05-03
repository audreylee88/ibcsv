#!/bin/bash

# /pt/s/r/ibcsv/1tkr_dl2csv.bash

# I use this script to download 1 tkr to a csv file.

if [ $# -ne 1 ]
then
  echo You need to give a tkr.
  echo Demo:
  echo $0 SPY
  exit 1
fi

TKR=$1
. ~/.orcl
. /pt/s/r/sp3/.jruby
export myts=`date +%Y_%m_%d_%H_%M`

set -x

date
cd /pt/s/r/ibcsv/

rsync -a /pt/s/r/ibcsv /bak/

cd /bak/ibcsv/
sleep 2
jruby req_hdata_1D.rb $TKR

exit 0
