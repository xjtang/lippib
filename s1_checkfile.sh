#!/bin/bash
# Landsat Time Series Preprocessing 
# Step 1
# Check The Checksums of All File
# One input argument sets the input folder
# By Chris Holden
# Modified by Xiaojing Tang

# check if filder exist
if [ ! -d $1 ]; then
    echo "Error - $1 is not a directory"
fi
# set working directory
cd $1

# loop over cksum files
for checksum in $(find ./ -name 'L*.cksum'); do

    # find basename of file and remove extension to match up with archive
    bn=$(basename $checksum | awk -F '.' '{ print $1 }')
    
    # test to see if archive exists
    archive=${bn}.tar.gz
    if [ ! -f $archive ]; then
        echo "$bn has no matching archive"
        continue
    fi
    
    # if archive exists, then validate checksum
    test=$(cksum $archive)
    if [ "$test" != "$(cat $checksum)" ]; then
        echo "!!!!! WARNING $bn may be corrupted !!!!!"
    else
        echo "$bn is ok"
    fi
done

echo "done!"
