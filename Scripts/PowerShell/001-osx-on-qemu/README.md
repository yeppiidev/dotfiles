# MacOS X (Puma) on QEMU

This script allows you to run MacOS X Puma using QEMU for PowerPC

# Usage

- Download the ISO image from [winworldpc.com](https://winworldpc.com/)
- Download the scripts from this repo and put it together with the ISO image in a folder
- Generate a disk image by running `generate_hdd.ps1`
- Install the OS on the generated hard disk by running `start_installer.ps1`
- After installation, close QEMU, and run `start_harddisk.ps1`

If everything went the way it should and installed the system correctly, you should see the OS X Puma desktop!

***PS: Incomplete documentation. May update later.***
