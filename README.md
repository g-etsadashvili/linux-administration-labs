# Linux Administration Labs

Welcome to my Linux administration portfolio. This repository documents practical labs and exercises completed while developing my Linux administration, Bash scripting, permissions management, and networking skills.

## What I'm Learning

- **Linux Administration** — Command-line tools, system management, and filesystem operations.
- **Bash Scripting** — Shell scripts, argument validation, and automation.
- **Permissions and Access Control** — Linux file permissions, `chmod`, and `umask`.
- **Networking and Remote Access** — NFS, SSH, SSHFS, and shared filesystems.

## Projects

### 1. Bash Argument Validation

**Folder:** [`bash-argument-validation/`](bash-argument-validation/)

A Bash scripting exercise that validates the number of command-line arguments supplied to a script.

**Topics covered:**
- Shebangs and script execution
- The `$#` special variable
- Conditional statements (`if`, `else`)
- Command-line argument validation

### 2. Permissions and Access Control

**Folder:** [`permissions-access-control/`](permissions-access-control/)

A practical lab exploring Linux file permissions and access control.

**Topics covered:**
- `chmod` and numeric permission modes
- File permission changes
- `umask`
- The sticky bit

### 3. NFS — Network File System

**Folder:** [`nfs-network-file-system/`](nfs-network-file-system/)

A lab documenting how to share a directory from an Ubuntu virtual machine and access it from a Raspberry Pi 3B+ using NFS.

**Topics covered:**
- NFS server and client setup
- `/etc/exports` configuration
- Mounting remote directories
- Verifying shared file access

### 4. SSHFS — SSH File System

**Folder:** [`sshfs-network-file-system/`](sshfs-network-file-system/)

A lab documenting the setup of SSHFS to access a directory on a Raspberry Pi 3B+ from an Ubuntu virtual machine over SSH.

**Topics covered:**
- SSHFS installation
- Remote filesystem mounting
- SSH authentication and network connectivity
- Verifying mounted directories and file access

*Note: The SSHFS project documents the intended procedure. Successful mounting and file creation should only be considered verified after testing.*

## My Lab Environment

- Ubuntu Linux virtual machine
- Raspberry Pi 3B+
- Bash
- Hyper-V virtualisation environment
- Linux networking and filesystem tools

## Repository Structure

Each project has its own directory containing a README with project-specific documentation and a script or reference file where applicable.

## Purpose

The goal of this repository is to document my practical learning, preserve useful commands, and demonstrate my progress in Linux administration through hands-on exercises.
