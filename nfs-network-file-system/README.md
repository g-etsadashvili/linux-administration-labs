# NFS — Network File System

## Overview

This project documents a practical NFS setup between an Ubuntu virtual machine and a Raspberry Pi 3B+. The Ubuntu VM acts as the NFS server, and the Raspberry Pi acts as the client.

The goal was to share a directory over the network, mount it on the client, and verify that files created through the client are accessible on the server.

## Environment

- **Server:** Ubuntu VM
- **Client:** Raspberry Pi 3B+
- **Protocol:** NFS
- **Server software:** `nfs-kernel-server`
- **Client software:** `nfs-common`

## 1. Server — Ubuntu VM

### Install the NFS server

```bash
sudo apt install nfs-kernel-server
```

### Create the shared directory

```bash
mkdir -p ~/my_share
```

The directory used in the lab was:

`/home/ubuntu-pc/my_share`

### Configure the export

Edit the exports configuration:

```bash
sudo nano /etc/exports
```

The lab used this export entry:

```text
/home/ubuntu-pc/my_share *(rw,sync,no_subtree_check)
```

This configuration permits read/write access for matching clients. The wildcard was used in the learning environment; production configurations should restrict access to trusted client addresses.

### Restart and verify the service

```bash
sudo systemctl restart nfs-kernel-server
sudo exportfs -v
sudo systemctl status nfs-kernel-server
```

## 2. Client — Raspberry Pi 3B+

### Install the client tools

```bash
sudo apt update
sudo apt install nfs-common
```

### Create the mount point

```bash
sudo mkdir -p /mnt/my_share
```

### Mount the shared directory

Replace `<NFS_SERVER_IP>` with the current IP address of the Ubuntu VM.

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

Then check the shared directory on the Ubuntu server:

```bash
ls -l ~/my_share/
```

The test file `test_nfs.txt` was visible in the Ubuntu server's shared directory, confirming that the NFS file-sharing test succeeded.

## Results

The NFS setup was completed successfully.

- The Ubuntu VM exported a shared directory.
- The Raspberry Pi mounted the exported directory.
- A file created through the client was visible on the server.
- The shared directory was accessed over the network.

## Concepts Practised

- Client-server architecture
- Installing Linux services
- Configuring `/etc/exports`
- Managing services with `systemctl`
- Export verification with `exportfs`
- Mounting network filesystems
- Verifying mounts with `findmnt`
- Testing file sharing between Linux systems

## Security Considerations

The wildcard export used in this lab is suitable only for a controlled learning environment. For real deployments, restrict NFS access to trusted clients and configure permissions appropriately.

## Future Improvements

- Restrict the export to the Raspberry Pi's IP address.
- Explore persistent mounts using `/etc/fstab`.
- Document troubleshooting for network, mount, and permission problems.
