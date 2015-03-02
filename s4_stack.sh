#!/bin/bash
# Landsat Time Series Preprocessing 
# Step 4
# Stack Layers Into Single Stack
# Two input arguments, sets the input folder, and UTM zone
# By Chris Holden
# Modified by Xiaojing Tang

# check directory
if [ ! -d $1 ]; then
    echo "Error - $here is not a directory"
fi

cd $1

# load module
module load gdal/1.10.0
module load batch_landsat

# main function
landsat_stack.py -q -p --files "L*band1.tif; L*band2.tif; L*band3.tif; L*band4.tif; L*band5.tif; L*band7.tif; L*band6.tif; L*cfmask.tif" \
    -b "1; 1; 1; 1; 1; 1; 1; 1" \
    -n "-9999; -9999; -9999; -9999; -9999; -9999; -9999; 255" \
    --utm $2 -o "*_stack" \
    --format "ENVI" --co "INTERLEAVE=BIP" --percentile=1 ./
    
echo "done!"
    
# done
