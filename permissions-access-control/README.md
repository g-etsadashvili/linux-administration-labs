# Linux File Permissions and Access Control Lab

## Overview

This project demonstrates basic Linux file permissions and access control using Bash on Ubuntu Linux. It was created as part of my Linux 1 studies to practise file permissions, permission notation, and access control commands.

## Environment

- Operating system: Ubuntu Linux
- Shell: Bash
- Tools: `ls`, `mkdir`, `touch`, `chmod`, `umask`

## Implemented Script

**File:** [`permissions_lab.sh`](permissions_lab.sh)

The script creates a temporary working directory at `/tmp/permissions-lab` and demonstrates the following:

- Creating test files using `touch`.
- Displaying file permissions using `ls -l`.
- Setting numeric permissions with `chmod 600` and `chmod 754`.
- Displaying the current `umask`.
- Adding group read permission with `chmod g+r`.
- Setting the sticky bit on a temporary directory using `chmod 1777`.
- Displaying directory permissions using `ls -ld`.

## Test Results

Tested on Ubuntu Linux by running:

```bash
bash permissions-access-control/permissions_lab.sh
```

The script executed successfully and displayed the expected permission changes.

Observed results included:

- `chmod 600 file1.txt` produced `-rw-------`.
- `chmod 754 file2.txt` produced `-rwxr-xr--`.
- The current `umask` was `0002`.
- Adding group read permission changed `file1.txt` to `-rw-r-----`.
- The sticky-bit directory displayed permissions beginning with `drwxrwxrwt`.

These results reflect the test environment used during execution.

## Concepts Practised

- Linux file permission notation: `r`, `w`, and `x`.
- Owner, group, and others.
- Numeric and symbolic permissions.
- The `chmod` command.
- The `umask` command.
- The sticky bit on directories.
- Reading permission information with `ls -l` and `ls -ld`.

## Future Improvements

Planned extensions to this lab include:

- Demonstrating directory permissions with `chmod 700`.
- Demonstrating how `umask 0002` affects newly created files and directories.
- Exploring setuid and setgid permissions in a safe temporary environment.
- Improving cleanup so temporary lab files can be removed easily.

## Cleanup

The script creates files under `/tmp/permissions-lab`. After checking that this is the lab directory, remove it with:

```bash
rm -r /tmp/permissions-lab
```

Only run this command when you are sure the directory contains only files created for this lab.

## Purpose

This repository documents practical Linux administration exercises completed during my Linux 1 studies. Future improvements will be added as they are implemented and tested.
