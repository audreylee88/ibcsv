#!/bin/bash

# /pt/s/r/ibcsv/ec2/rsync_ec2.bash

# I run this script in the office, not on ec2.
# I use this script to rsync changes I make in my office to ec2.

set -x

cd /pt/s/r/ibcsv/
ssh ec210 "mkdir -p /pt/s/r/ibcsv/"
rsync -avz /pt/s/r/ibcsv/ ec210:/pt/s/r/ibcsv/

exit
