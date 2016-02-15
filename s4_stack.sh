#!/bin/bash
# Landsat Time Series Preprocessing 
# Step 4
# Stack Layers Into Single Stack
# Four input arguments, set the input folder, UTM zone and resize method
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
landsat_stack.py -q -p --files "L*sr*1.tif; L*sr*2.tif; L*sr*3.tif; L*sr*4.tif; L*sr*5.tif; L*sr*7.tif; L*61.tif; L*cfmask.tif" \
    -b "1; 1; 1; 1; 1; 1; 1; 1" \
    -n "-9999; -9999; -9999; -9999; -9999; -9999; -9999; 255" \
    --utm $2 -o "*_stack" \
    --format "ENVI" --co "INTERLEAVE=BIP" --$3=$4 ./
    
echo "done!"
    
# done
