
# ============================================================
# SSHFS LAB — RASPBERRY PI (SERVER) AND UBUNTU VM (CLIENT)
#
# This file contains TWO SEPARATE SCRIPTS.
# Copy each section into its own file before running it.
# ============================================================


# ============================================================
# SCRIPT 1: SSHFS SERVER — RASPBERRY PI 3B+
# Save this section as sshfs_server.sh on the Raspberry Pi.
# ============================================================

#!/bin/bash

# 1. Create the shared directory
mkdir -p /home/giorgi/sshfs_share

# 2. Check that the SSH service is running
sudo systemctl status ssh

# 3. Check the shared directory
ls -ld /home/giorgi/sshfs_share

# 4. Find the Raspberry Pi's IP address
hostname -I


# ============================================================
# SCRIPT 2: SSHFS CLIENT — UBUNTU VM
# Save this section as sshfs_client.sh on Ubuntu.
# ============================================================

#!/bin/bash

# 1. Install SSHFS
sudo apt update
sudo apt install sshfs

# 2. Create the mount point
mkdir -p ~/sshfs_mount

# 3. Mount the Raspberry Pi's shared directory
# Replace PI_USERNAME and RASPBERRY_PI_IP with your own values.
sshfs PI_USERNAME@RASPBERRY_PI_IP:/home/giorgi/sshfs_share ~/sshfs_mount

# 4. Verify the mount
findmnt ~/sshfs_mount

# 5. List the shared files
ls -la ~/sshfs_mount

# 6. Create a test file through the mounted directory
touch ~/sshfs_mount/test_sshfs.txt

# 7. Verify the test file
ls -l ~/sshfs_mount
