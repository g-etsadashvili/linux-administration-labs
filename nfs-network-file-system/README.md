# NFS — Network File System

## Overview

This project documents a practical Network File System (NFS) lab between an Ubuntu virtual machine and a Raspberry Pi 3B+.

The Ubuntu VM acts as the NFS server, while the Raspberry Pi acts as the client. The objective is to share a directory over the network, mount it on the client, and verify that a file created through the client is accessible on the server.

## Environment

- **Server:** Ubuntu virtual machine
- **Client:** Raspberry Pi 3B+
- **Protocol:** NFS
- **Server package:** `nfs-kernel-server`
- **Client package:** `nfs-common`

## Lab Script

**File:** `nfs_lab.sh`

The script documents the commands used in this lab, separated into server and client sections.

- The server section covers installing NFS, creating the shared directory, configuring the export, restarting the service, and checking the exported directory.
- The client section documents installing NFS client tools, creating the mount point, mounting the shared directory, and testing file access.

The client commands are commented out because they must be executed on the Raspberry Pi, not on the Ubuntu server. Editing `/etc/exports` also requires manual configuration.

The script is intended as a reference for the lab procedure rather than a fully automated setup.

## 1. Server Configuration — Ubuntu VM

### Install the NFS server

```bash
sudo apt install nfs-kernel-server
```

### Create the shared directory

```bash
mkdir ~/my_share
```

The directory used in the lab was:

`/home/ubuntu-pc/my_share`

### Configure the NFS export

Open the exports configuration file:

```bash
sudo nano /etc/exports
```

The lab used this export entry:

```text
/home/ubuntu-pc/my_share *(rw,sync,no_subtree_check)
```

This configuration allows matching clients to access the exported directory with read/write permissions. The wildcard permits access from any client that can reach the server and should only be used in a controlled learning environment.

### Restart and verify the service

Restart the NFS server:

```bash
sudo systemctl restart nfs-kernel-server
```

Display the exported directories:

```bash
sudo exportfs -v
```

Check the service status:

```bash
systemctl status nfs-kernel-server
```

Inspect the shared directory:

```bash
ls -l ~/my_share/
```

## 2. Client Configuration — Raspberry Pi 3B+

### Update packages and install the NFS client

```bash
sudo apt update
sudo apt install nfs-common
```

### Create the mount point

```bash
sudo mkdir -p /mnt/my_share
```

### Mount the shared directory

Replace `<NFS_SERVER_IP>` with the current IP address of the Ubuntu VM:

```bash
sudo mount -t nfs <NFS_SERVER_IP>:/home/ubuntu-pc/my_share /mnt/my_share
```

### Verify the mount

```bash
findmnt /mnt/my_share
```

## 3. Test File Sharing

Create a test file from the Raspberry Pi client:

```bash
touch /mnt/my_share/test_nfs.txt
```

Then, on the Ubuntu server, inspect the shared directory:

```bash
ls -l ~/my_share/
```

The file `test_nfs.txt` was visible in the Ubuntu server's shared directory during the lab, confirming that file sharing between the client and server worked.

## Results

The NFS lab was completed successfully.

- The Ubuntu VM exported a shared directory.
- The Raspberry Pi mounted the exported directory.
- A file created through the client was visible on the server.
- The shared directory was accessed over the network.

## Concepts Practised

- Client-server architecture
- Installing Linux packages
- Configuring `/etc/exports`
- Managing services with `systemctl`
- Verifying NFS exports with `exportfs`
- Mounting network filesystems
- Checking mounts with `findmnt`
- Testing file sharing between Linux systems

## Security Considerations

The wildcard export used in this lab is suitable only for a controlled learning environment. In real deployments, restrict the export to trusted client IP addresses and configure file permissions appropriately.

NFS access permissions should be considered together with the underlying Linux filesystem permissions.

## Future Improvements

- Restrict the export to the Raspberry Pi's IP address.
- Explore persistent mounts using `/etc/fstab`.
- Add error handling to the lab script.
- Document troubleshooting for network connectivity, mount failures, and permissions.

## Purpose

This project demonstrates practical Linux administration skills developed during my Linux 1 studies. It documents the NFS configuration, the commands used, and the verification of file sharing between two Linux systems.
