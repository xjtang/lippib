# Landsat Time Series Preprocessing 
# Step 1
# Find and extract the tar.gz file
# One input argument sets the input folder
# By Chris Holden
# Modified by Xiaojing Tang

if [ ! -d $1 ]; then
    echo "Error - $here is not a directory"
fi

cd $1

# total numnber of tar.ge files
n = $(find ./ -name '*tar.gz' | wc -l)
# initialize count
i = 1

# loop through all files
for archive in $(find ./ -name '*tar.gz'); do

    echo "<----- $i / $n: $(basename $archive)"
    dname=$(dirname $archive)
    
    # Extract archive to temporary folder
    tar -xzvf $archive -C $dname/
    
    # Iterate count
    let i+=1
    
done

echo "done"
