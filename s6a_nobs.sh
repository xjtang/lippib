#!/bin/bash
# Landsat Time Series Preprocessing 
# Step 6a
# Generate Number of Clear Observation Image
# One input argument sets the input folder
# By Chris Holden
# Modified by Xiaojing Tang

# check if input directory exist
if [ ! -d $1 ]; then
    echo "Error - $1 is not a directory"
fi

# move to input directory
cd $1

# load module
module load batch_landsat

# run main script
stack_nobs.py --dname 'L*' --format GTiff ./ nobs.gtif 2 3 4

echo 'done!'

# done
