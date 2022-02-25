# From yeppiidev's stuff/Scripts/PowerShell/001-osx-on-qemu

# What does this do?
# This script allows you to generate a .qcow2 
# image using qemu-img. 

# For instructions on how to use this script, 
# please refer to README.md at the root of 
# this script folder

# Get the required details
$hdd = Read-Host 'Enter the name of the hard disk file'
$size = Read-Host 'Enter the size of the hard disk file (M for megs, G for gigs, etc.)'

# P.S: You need to have qemu-img installed
# in order to run this script. You can change this
# to the path of qemu-img if it is not in the %PATH%
# enviornment variable
$tool = "qemu-img";

# Generate an array of parameters
[Array]$params = "create", "-f", "qcow2", $hdd, $size;

try {
    # Try executing the tool
    & $tool $params
} finally {
    # TODO: Improve this error message
    Write-Host -ForegroundColor Yellow "The disk creation process was cancelled. Please re-run the script and enter in the correct details without any errors."
}
