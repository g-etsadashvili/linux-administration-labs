
# ============================================================
# NFS LAB — UBUNTU VM (SERVER) AND RASPBERRY PI (CLIENT)
#
# This file contains TWO SEPARATE SCRIPTS.
# Copy each section into its own file before running it.
# ============================================================


# ============================================================
# SCRIPT 1: NFS SERVER — UBUNTU VM
# Save this section as nfs_server.sh
# ============================================================

#!/bin/bash

# 1. Install the NFS server
sudo apt install nfs-kernel-server

# 2. Create the shared directory
mkdir -p ~/my_share

# 3. Configure the NFS export
sudo nano /etc/exports

# Add this entry in /etc/exports:
# /home/ubuntu-pc/my_share *(rw,sync,no_subtree_check)

# 4. Restart the NFS service
sudo systemctl restart nfs-kernel-server

# 5. Check the exported directories
sudo exportfs -v

# 6. Check the NFS service
systemctl status nfs-kernel-server

# 7. Check the shared directory
ls -l ~/my_share/


# ============================================================
# SCRIPT 2: NFS CLIENT — RASPBERRY PI 3B+
# Save this section as nfs_client.sh
# ============================================================

#!/bin/bash

# 1. Update package information
sudo apt update

# 2. Install NFS client tools
sudo apt install nfs-common

# 3. Create the mount point
sudo mkdir -p /mnt/my_share

# 4. Mount the Ubuntu server's shared directory
# Replace <UBUNTU_SERVER_IP> with the Ubuntu VM's actual IP.
sudo mount -t nfs <UBUNTU_SERVER_IP>:/home/ubuntu-pc/my_share /mnt/my_share

# 5. Verify the mount
findmnt /mnt/my_share

# 6. Create a test file through the client
touch /mnt/my_share/test_nfs.txt

# 7. List the shared files
ls -l /mnt/my_share/
