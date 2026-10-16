#!/bin/bash

# NFS Lab: Ubuntu VM (Server) and Raspberry Pi (Client)
# Based on the commands used in the lab.

# ==================================================
# SERVER - UBUNTU VM
# ==================================================

# 1. Install the NFS server
sudo apt install nfs-kernel-server

# 2. Create the shared directory
mkdir -p ~/my_share

# 3. Configure the NFS export
sudo nano /etc/exports

# Add this line in /etc/exports:
# /home/ubuntu-pc/my_share *(rw,sync,no_subtree_check)

# 4. Restart the NFS service
sudo systemctl restart nfs-kernel-server

# 5. Check the exported directories
sudo exportfs -v

# 6. Check the NFS service
systemctl status nfs-kernel-server

# 7. Check files in the shared directory
ls -l ~/my_share/


# ==================================================
# CLIENT - RASPBERRY PI
# ==================================================

# 1. Update package information and install NFS tools
# Run these commands on the Raspberry Pi:
# sudo apt update
# sudo apt install nfs-common

# 2. Create the mount point
# sudo mkdir -p /mnt/my_share

# 3. Mount the Ubuntu server's shared directory
# Replace <UBUNTU_SERVER_IP> with the actual Ubuntu VM IP.
# sudo mount -t nfs <UBUNTU_SERVER_IP>:/home/ubuntu-pc/my_share /mnt/my_share

# 4. Check the mount
# findmnt /mnt/my_share

# 5. Create a test file through the client
# touch /mnt/my_share/test_nfs.txt

# 6. Verify the file on the Ubuntu server
# ls -l ~/my_share/
