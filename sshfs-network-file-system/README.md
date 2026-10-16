# SSHFS — Secure File Sharing over SSH

## Overview

This lab demonstrates how to access a directory on a Raspberry Pi 3B+ remotely from an Ubuntu virtual machine using SSHFS (SSH File System).

SSHFS mounts a remote directory over SSH, allowing the client to access remote files through a local mount point.

## Lab Environment

- **Server:** Raspberry Pi 3B+ running Ubuntu/Linux
- **Client:** Ubuntu virtual machine
- **Remote shared directory:** `/home/giorgi/sshfs_share`
- **Client mount point:** `~/sshfs_mount`
- **Protocol:** SSH
- **Tool:** SSHFS

## Repository Contents

- `sshfs_lab.sh` — Reference file containing two separate scripts:
  - **Script 1:** Server-side preparation for the Raspberry Pi.
  - **Script 2:** Client-side SSHFS setup and mounting on Ubuntu.

Each section has its own `#!/bin/bash` line. Copy the appropriate section into a separate script on the corresponding machine before running it. Do not execute the combined reference file as one script.

## Server Setup — Raspberry Pi

The server section creates the shared directory and checks the SSH service.

```bash
mkdir -p /home/giorgi/sshfs_share
sudo systemctl status ssh
ls -ld /home/giorgi/sshfs_share
hostname -I
```

The SSH service must be running, and the client must be able to connect to the Raspberry Pi over the network.

## Client Setup — Ubuntu VM

Install SSHFS and create the local mount point:

```bash
sudo apt update
sudo apt install sshfs
mkdir -p ~/sshfs_mount
```

Mount the remote directory, replacing the username and IP placeholders with the appropriate values for your own Raspberry Pi:

```bash
sshfs PI_USERNAME@RASPBERRY_PI_IP:/home/giorgi/sshfs_share ~/sshfs_mount
```

Verify the mount and list the remote files:

```bash
findmnt ~/sshfs_mount
ls -la ~/sshfs_mount
```

To test file access, create a file through the mounted directory:

```bash
touch ~/sshfs_mount/test_sshfs.txt
ls -l ~/sshfs_mount
```

## Important Notes

- Replace `PI_USERNAME` and `RASPBERRY_PI_IP` with your own connection details.
- SSH authentication must be configured or completed when prompted.
- The Raspberry Pi user must have appropriate permissions for the shared directory.
- The mount command must succeed before the test-file commands can verify remote access.
- This repository documents the lab procedure; successful mounting and file creation should only be reported as verified after the test has actually succeeded.

## Learning Objectives

- Understand how SSHFS uses SSH to access remote files.
- Distinguish between a remote directory and a local mount point.
- Install and use SSHFS on Ubuntu.
- Identify the server's network address.
- Verify a mounted filesystem and test file access.
- Document a practical Linux networking lab in GitHub.
