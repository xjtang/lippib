#!/bin/bash
# Landsat Time Series Preprocessing 
# Step 2
# Filter L1G Images
# One input argument sets the input folder
# By Chris Holden
# Modified by Xiaojing Tang

# check if input folder exist
if [ ! -d $1 ]; then
    echo "Error - $1 is not a directory"
fi

# move to input folder
cd $1

# check if L1G folder exist
if [ ! -d L1G ]; then
    mkdir L1G/
fi

# loop through all files
for mtl in $(find ./ -name 'L*MTL.txt'); do

    # get image id
    id=$(basename $(dirname $mtl))
    
    # find sign of L1T
    l1t=$(grep "L1T" $mtl)
    
    # move L1G image to a separate folder
    if [ "$l1t" == "" ]; then
        echo "$id is not L1T"
        mv $(dirname $mtl) L1G
    else
        echo "$id is L1T"
    fi
    
done

echo 'done!'

# done
