#!/bin/bash
# Landsat Time Series Preprocessing 
# Step 0
# Sumbit Jobs
# First Input Argument Sets the Script to Run
# By Xiaojing Tang

# specify shell
#$ -S /bin/bash

# set duration
#$ -l h_rt=24:00:00

# forward current environment
#$ -V

# job name
#$ -N Landsat_PreProcessing

# log file
#$ -o qlog.txt

# print progress
echo "=========================================================="
echo "Starting on : $(date)"
echo "Running on node : $(hostname)"
echo "Current directory : $(pwd)"
echo "Current job ID : $JOB_ID"
echo "Current job name : $JOB_NAME"
echo "Task index number : $SGE_TASK_ID"
echo "=========================================================="

# run bash script
sp=$1
chmod u+x $sp
$sp $2 $3

# print end of job
echo "=========================================================="
echo "Finished on : $(date)"
echo "=="

# done

