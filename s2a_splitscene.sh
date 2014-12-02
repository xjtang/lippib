#!/bin/bash
# Landsat Time Series Preprocessing 
# Step 2a
# Split Data into Scenes
# One input argument sets the input folder
# By Xiaojing Tang

# check if filder exist
if [ ! -d $1 ]; then
    echo "Error - $here is not a directory"
fi
# set working directory
cd $1

# get total number of files
n=$(find ./ -maxdepth 1 -name '*tar.gz' | wc -l)
# initiate count
i=1

# only level 1 directory will be processed
for archive in $(find ./ -maxdepth 1 -name '*tar.gz'); do

    # print progress
    echo "<----- $i / $n: $(basename $archive)"
    
    # get scene id
    sid=p${archive:3:2}r${archive:6:2}

    # create directory if not exist
    if [ ! -d $sid ]
	    mkdir ./$sid 
    fi
    td=./$sid/    

    # move tar file into folder
    mv $archive $td

    # move checksum into folder
    cksm=${archive/tar.gz/cksum}
    mv $cksm $td
    
    # iterate count
    let i+=1
    
done

echo "done!"

# done
