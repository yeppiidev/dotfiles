# From yeppiidev's stuff/Scripts/PowerShell/001-osx-on-qemu

# What does this do?
# This script allows you to generate a .qcow2 
# image using qemu-img. 

# For instructions on how to use this script, 
# please refer to README.md at the root of 
# this script folder

# Get the required details
$hdd = Read-Host 'filename of the virtual disk'
$size = Read-Host 'size of the virtual disk (M for megs, G for gigs, etc.)'

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
    Write-Host -ForegroundColor Yellow "error: the disk creation process was cancelled. please re-run the script and enter in the correct details without any errors."
}
