#!/bin/bash

# /pt/s/r/ibcsv/rsync_csv2ec2.bash

# I run this script in the office, not on ec2.
# I use this script to rsync CSV files collected in the office to ec2.

set -x

cd /pt/s/r/ibcsv/

# Rsync software 1st:
/pt/s/r/ibcsv/rsync_ec2.bash

# ssh ec210 "mkdir -p /pt/s/r/ibcsv/"
# rsync -avz /pt/s/r/ibcsv/ ec210:/pt/s/r/ibcsv/

# I might need to make room so do that:
ssh ec210 'bash -x /pt/s/r/ibcsv/ec2_rm_oldcsv.bash'

# Do it:
cd /bak/ibcsv/csv_files/
# find . -type f -name '*gmt.csv' -mtime -1 -exec ls -l {} \;
find . -type f -name '*gmt.csv' -mtime -1 -exec rsync -avz {} ec210:/bak/ibcsv/csv_files/ \;

exit
