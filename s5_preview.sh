#!/bin/bash
# Landsat Time Series Preprocessing 
# Step 5
# Generate Preview Images
# One input argument sets the input folder
# By Chris Holden
# Modified by Xiaojing Tang

# check if input folder exist
if [ ! -d $1 ]; then
    echo "Error - $1 is not a directory"
fi

# move to input folder
cd $1

# get scene id
sid=$(basename $1)

# load modules
module load gdal/1.10.0
module load batch_landsat

# loop through images
for stack in $(find ./ -name '*stack'); do
    id=$(basename $(dirname $stack))
    echo "Making preview image for $id"
    gen_preview.py --maskval "2 3 4 255" --format PNG -b "5 4 3" --resize_pct 25 --manual "0 8000" $stack ${id}_preview.png
done

# create output drectory
if [ ! -d ./${sid}_preview/ ]; then
    mkdir ./${sid}_preview
fi

# move png
mv ./*.png* ./${sid}_preview/

echo "done!"

# done
