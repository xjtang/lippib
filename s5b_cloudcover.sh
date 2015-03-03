#!/bin/bash
# Landsat Time Series Preprocessing 
# Step 5b
# Generate Cloud Cover Summary
# One input argument sets the input folder
# By Chris Holden
# Modified by Xiaojing Tang

# check if input folder exists
if [ ! -d $1 ]; then
    echo "Error - $1 is not a directory"
fi

# move to input directory
cd $1

for mtl in $(find ./ -name '*MTL.txt'); do
    id=$(basename $(dirname $mtl))
    echo $id,${id:0:3},${id:3:3},${id:6:3},${id:9:4},${id:13:3},$(grep "CLOUD_COVER" $mtl | tr -d ' ' | awk -F '=' '{ print $2 }') >> cloud.txt
done

echo 'done'

# done
