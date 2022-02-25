# MacOS X (Puma) on QEMU

This script allows you to run MacOS X Puma using QEMU for PowerPC

## Usage

# Installing OS X Puma

- Download the ISO image from <winworldpc.com>
- Download the scripts from this repo and put it together with the ISO image in a folder
- Generate a disk image by running `generate_hdd.ps1`
- Install the OS on the generated hard disk by running `start_installer.ps1`
- After installation, close QEMU, and run `start_harddisk.ps1`

If everything worked correctly, you should see the OS X Puma desktop!

***Note: This is a WIP (Work-In-Progress) page. I will update this page later with more details soon!***