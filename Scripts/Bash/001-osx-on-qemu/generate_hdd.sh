#!/bin/bash

# From yeppiidev's stuff/Scripts/Bash/001-osx-on-qemu

# What does this do?
# This script allows you to generate a .qcow2 
# image using qemu-img. 

# For instructions on how to use this script, 
# please refer to README.md at the root of 
# this script folder

# Get the required details
read -p 'filename of the virtual disk: ' FILENAME
read -p 'size of the virtual disk (M for megs, G for gigs, etc.): ' SIZE

# P.S: You need to have qemu-img installed
# in order to run this script. You can change this
# to the path of qemu-img if it is not in the %PATH%
# enviornment variable
TOOL="qemu-img"

# Generate an array of parameters
PARAMS="create -f qcow2 $FILENAME $SIZE"

# Try executing the tool
$TOOL $PARAMS