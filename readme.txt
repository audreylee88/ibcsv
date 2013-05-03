/pt/s/r/ibcsv/readme.txt

This dir contains scripts to download CSV data from IB.

Here is a scenario which currently appeals to me:
  I setup a loop on v2
  Every 5 min I download 11 CSV files to /bak/ibcsv/csv_files/
  I gzip any files older than 1 day and move them to /bak/ibcsv/csv_files_old/
  I rm any files older than 5 days from /bak/ibcsv/csv_files_old
  I rsync v2 csv_files to ec210:/bak/ibcsv/csv_files
  I rm any files older than 1 day from ec210:/bak/ibcsv/csv_files

At this point ibcsv is done.

Next, h3h is running in a separate process/loop.

  It looks for new CSV files in /bak/ibcsv/csv_files/
  It sqlloads them into ibs_stage, ibs5min
  It runs SVM on the new data to give me new predictions

I think the only thing 
which changes the way I currently have h3h setup 
is that h3h is currently looking for the new CSV files 
in /bak/h3h/ibapi/csv_files/

