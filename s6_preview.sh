#!/bin/bash
# Landsat Time Series Preprocessing 
# Step 6
# Generate Preview Images
# Two input argument sets the input folder and output folder
# By Chris Holden
# Modified by Xiaojing Tang

# check if input folder exist
if [ ! -d $1 ]; then
    echo "Error - $1 is not a directory"
fi

# check output directory
if [ ! -d $2 ]; then
    mkdir $2
fi

# move to input folder
cd $1

# load modules
module load gdal/1.10.0
module load batch_landsat

# loop through images
for stack in $(find ./ -name '*stack'); do
    id=$(basename $(dirname $stack))
    echo "Making preview image for $id"
    gen_preview.py --maskval "2 3 4 255" --format PNG -b "5 4 3" --resize_pct 25 --manual "0 8000" $stack $2${id}_preview.png
done

echo "done!"

# done
