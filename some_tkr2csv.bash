#!/bin/bash

# /pt/s/r/ibcsv/some_tkr2csv.bash

# I use this script to implement some of my ideas described here:
# /pt/s/r/ibcsv/readme.txt

set -x
cd /pt/s/r/ibcsv/

# Any file older than 5 days should be removed from 
# /bak/ibcsv/csv_files_old/

rsync -a /pt/s/r/ibcsv /bak/

cd /bak/ibcsv/csv_files_old/
cp -p /etc/hosts.allow random_old_file.gz
find . -type f -name '*.gz' -mtime +5 -print | xargs ls -l
find . -type f -name '*.gz' -mtime +5 -print | xargs rm -f

# Move files older than 1 day from 
# /bak/ibcsv/csv_files/
# to
# /bak/ibcsv/csv_files_old/
# and compress them
cd /bak/ibcsv/csv_files/
cp -p /etc/hosts.allow random_old_file.csv
find . -type f -name '*.csv' -mtime +1 -print | xargs ls -l

# see if -1 works okay:
# find . -type f -mtime -1 -print | xargs ls -l

find . -type f -name '*.csv' -mtime +1 -exec mv {} /bak/ibcsv/csv_files_old/ \;
ls -l /bak/ibcsv/csv_files_old/*.csv


exit

/pt/s/r/ibcsv/1tkr_dl2csv.bash DIA
/pt/s/r/ibcsv/1tkr_dl2csv.bash EFA 
/pt/s/r/ibcsv/1tkr_dl2csv.bash FXI
/pt/s/r/ibcsv/1tkr_dl2csv.bash GLD
/pt/s/r/ibcsv/1tkr_dl2csv.bash IWM
/pt/s/r/ibcsv/1tkr_dl2csv.bash QQQ
/pt/s/r/ibcsv/1tkr_dl2csv.bash SLV
/pt/s/r/ibcsv/1tkr_dl2csv.bash SPY
/pt/s/r/ibcsv/1tkr_dl2csv.bash TLT 
/pt/s/r/ibcsv/1tkr_dl2csv.bash WFC
/pt/s/r/ibcsv/1tkr_dl2csv.bash XOM

# New files should now be here:
# /bak/ibcsv/csv_files/

