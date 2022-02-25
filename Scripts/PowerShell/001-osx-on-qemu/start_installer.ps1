# From yeppiidev's stuff/Scripts/PowerShell/001-osx-on-qemu

# What does this do?

# This script allows you to start OS X
# installer ISO and install the OS on
# the attached virtual hard disk image

# For instructions on how to use this script, 
# please refer to README.md at the root of 
# this script folder

$cdrom = Read-Host "Enter the ISO image filename"

# Change this to the filename of the 
# disk image you have created
$hdd = "HardDisk.qcow2"

# P.S: You need to have qemu installed on your system
# in order to run this script. You can change this
# to the path of qemu-system-ppc64 if it is not in 
# the %PATH% enviornment variable
$qemu_ppc_exec = "qemu-system-ppc64"

# This command retrives the qemu path IYDK
$qemu_location = Get-Command $qemu_ppc_exec

# Change the parameters according to your needs
$params = "-cdrom {0} -drive 'file={1},format=qcow2' -L pc-bios -boot d -M g3beige -cpu G4 -m 1G" -f $cdrom, $hdd

# Check if the hard disk image exists
if (-not(Test-Path -Path $hdd -PathType Leaf)) {
     return "Error starting the VM: {0} does not exist!" -f $hdd
}

Write-Host "Using QEMU binary from $qemu_location"

# Start qemu with arguments provided in $params
Invoke-Expression -Command "$qemu_ppc_exec $params"