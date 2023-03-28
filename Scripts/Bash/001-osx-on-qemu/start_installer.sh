# From yeppiidev's stuff/Scripts/Bash/001-osx-on-qemu

# What does this do?

# This script allows you to start OS X
# installer ISO and install the OS on
# the attached virtual hard disk image

# For instructions on how to use this script, 
# please refer to README.md at the root of 
# this script folder

read -p "installer image filename: " INSTALLER_IMG

# Change this to the filename of the 
# disk image you have created
HDD="HardDisk.qcow2"

# P.S: You need to have qemu installed on your system
# in order to run this script. You can change this
# to the path of qemu-system-ppc64 if it is not in 
# the %PATH% enviornment variable
QEMU_EXEC="qemu-system-ppc64"

# This command retrives the qemu path IYDK
QEMU_LOCATION=$(which $QEMU_EXEC)

# Change the parameters according to your needs
PARAMS="-cdrom $QEMU_EXEC -drive 'file=$HDD,format=qcow2' -L pc-bios -boot d -M g3beige -cpu G4 -m 1G"

# Check if the hard disk image exists
if [ ! -f "$HDD" ]; then
     echo "error starting the VM: $HDD does not exist!"
     exit
fi

echo "info: using QEMU binary from $QEMU_LOCATION"

# Start qemu with arguments provided in $params
$QEMU_EXEC $PARAMS