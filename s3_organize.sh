#!/bin/bash
# Landsat Time Series Preprocessing 
# Step 3
# Find and extract the tar.gz file
# One input argument sets the input folder
# By Chris Holden
# Modified by Xiaojing Tang

# check if filder exist
if [ ! -d $1 ]; then
    echo "Error - $here is not a directory"
fi
# set working directory
cd $1

# total number of tar.gz files
n = $(find ./ -maxdepth 1 -name '*tar.gz' | wc -l)
# initialize count
i = 1

# loop through all tar.gz files
for archive in $(find ./ -maxdepth 1 -name '*tar.gz'); do

    # print progress
    echo "<----- $i / $n: $(basename $archive)"
    
    # create temporary folder for storage
    mkdir temp
    
    # extract archive to temporary folder
    tar -xzvf $archive -C temp/
    
    # find ID based on MTL file's filename
    mtl = $(find temp/ -name 'L*MTL.txt')
    
    # test to make sure we found it
    if [ ! -f $mtl ]; then
        echo "Could not find MTL file for $archive"
        break
    fi
    
    # use AWK to remove _MTL.txt and extract pure ID
    id = $(basename $mtl | awk -F '_' '{ print $1 }')
    
    # move archive into temporary folder and rename 
    mv $archive temp/$id.tar.gz
    
    # move checksum into temporary folder and rename
    cksm=${archive/tar.gz/cksum}
    mv $cksm temp/$id.cksum
    
    # rename archive
    mv temp $id
    
    # Iterate count
    let i+=1
    
done

echo "done!"
