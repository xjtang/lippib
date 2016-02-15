#!/bin/bash
# Landsat Time Series Preprocessing 
# Step 5
# Clean Up Unnecessary Files
# One input argument sets the input folder
# By Chris Holden
# Modified by Xiaojing Tang

# check directory
if [ ! -d $1 ]; then
    echo "Error - $here is not a directory"
fi

cd $1

# main function
for archive in $(find ./ -maxdepth 2 -name '*tar.gz'); do
    rm $archive
done
for archive in $(find ./ -maxdepth 2 -name '*.tif'); do
    rm $archive
done
    
echo "done!"
    
# done
