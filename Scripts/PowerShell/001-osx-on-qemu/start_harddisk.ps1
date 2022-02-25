# From yeppiidev's stuff/Scripts/PowerShell/001-osx-on-qemu

# What does this do?

# This script allows you to boot OS X 
# from the qcow2 image (Given that OS X 
# is installed on that image)

# For instructions on how to use this script, 
# please refer to README.md at the root of 
# this script folder

# You can modify this to your disk image name

$hdd = "HardDisk.qcow2"

# Check if the disk image exists
if (-not(Test-Path -Path $hdd -PathType Leaf)) {
     return "Unable to start the VM: $hdd does not exist!"
}

# Start qemu with required args
qemu-system-ppc64 -drive 'file=HardDisk.qcow2,format=qcow2' -L pc-bios -M g3beige -m 800M -cpu G4 -g 1024x768x32 -prom-env "vga-ndrv?=true" -device VGA,edid=on -device sungem,netdev=network01 -netdev user,id=network01 -nic user,ipv6=off,model=e1000,mac=52:54:98:76:54:32 -sdl -ctrl-grab -accel tcg,thread=multi