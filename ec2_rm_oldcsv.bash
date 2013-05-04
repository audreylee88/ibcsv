#!/bin/bash

# /pt/s/r/ibcsv/ec2_rm_oldcsv.bash

# I use this script to implement some of my ideas described here:
# /pt/s/r/ibcsv/readme.txt
# This script removes old CSV files from the ec2 host.

# Demo:
# ssh ec210 'bash -x /pt/s/r/ibcsv/ec2_rm_oldcsv.bash'
# Avoid doing this:
# bash -x /pt/s/r/ibcsv/ec2_rm_oldcsv.bash

# Now assume I'm on an ec2 host,
# not in the office.
set -x
cd /pt/s/r/ibcsv/

# Any file older than 1 day should be removed from 
# /bak/ibcsv/csv_files/

rsync -a /pt/s/r/ibcsv /bak/

cd /bak/ibcsv/csv_files/
cp -p /etc/hosts.allow /bak/ibcsv/csv_files/random_old_file.csv
find /bak/ibcsv/csv_files/ -type f -name '*.csv' -mtime +1 -print | xargs ls -l
find /bak/ibcsv/csv_files/ -type f -name '*.csv' -mtime +1 -print | xargs rm -f

exit
