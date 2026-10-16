# Linux File Permissions and Access Control Lab

## Overview

This lab explores Linux file permissions and access control using Ubuntu Linux. It focuses on how Linux controls who can read, write, and execute files and directories.

The exercises are designed to practise concepts covered in Linux 1.

## Learning Objectives

- Understand Linux file permissions: read (`r`), write (`w`), and execute (`x`).
- Interpret permissions displayed by `ls -l`.
- Change permissions using `chmod`.
- Understand symbolic and numeric permission notation.
- Explain how `umask` affects default permissions.
- Understand the importance of execute permission on directories.
- Explore the sticky bit in a temporary shared directory.

## Environment

- Operating system: Ubuntu Linux
- Shell: Bash
- Tools: `ls`, `mkdir`, `touch`, `chmod`, `umask`

## Exercise 1: Create a Lab Directory

Create a temporary directory and enter it:

```bash
mkdir -p /tmp/permissions-lab
cd /tmp/permissions-lab
```

Create two test files:

```bash
touch file1.txt file2.txt
```

List the files and their permissions:

```bash
ls -l
```

**What to observe:** The output displays permissions, ownership, file size, and modification time.

## Exercise 2: Understand Permission Notation

Linux permissions are divided into three groups:

| Group | Meaning |
|---|---|
| Owner | Permissions for the file's owner |
| Group | Permissions for members of the file's group |
| Others | Permissions for everyone else |

The three basic permissions are:

| Permission | Meaning | Numeric value |
|---|---|---:|
| `r` | Read | 4 |
| `w` | Write | 2 |
| `x` | Execute | 1 |
| `-` | No permission | 0 |

For example, `rwxr-xr--` means:

- Owner: read, write, execute (`7`)
- Group: read, execute (`5`)
- Others: read (`4`)

The equivalent numeric notation is `754`.

## Exercise 3: Change Permissions with chmod

Set restrictive permissions on the first file:

```bash
chmod 600 file1.txt
ls -l file1.txt
```

Add read permission for the group:

```bash
chmod g+r file1.txt
ls -l file1.txt
```

Set permissions using numeric notation:

```bash
chmod 754 file2.txt
ls -l file2.txt
```

**Questions to consider:**

- What changed after each `chmod` command?
- What is the difference between `chmod 600` and `chmod 754`?
- What do `u`, `g`, and `o` represent in symbolic permission notation?

## Exercise 4: Directory Permissions

Create a test directory:

```bash
mkdir testdir
ls -ld testdir
```

Set its permissions:

```bash
chmod 700 testdir
ls -ld testdir
```

For directories, the permissions have special practical meanings:

- `r`: allows listing directory entries.
- `w`: allows creating, deleting, or renaming entries when the required permissions are satisfied.
- `x`: allows searching or traversing the directory.

**Important:** Directory permissions affect access to files inside the directory. The execute permission is particularly important for accessing items by name.

## Exercise 5: Understand umask

Display the current `umask`:

```bash
umask
```

Temporarily set the mask to `0002` in the current shell:

```bash
umask 0002
```

Create a new file and directory:

```bash
touch umask-file.txt
mkdir umask-dir
```

Inspect their permissions:

```bash
ls -l umask-file.txt
ls -ld umask-dir
```

A `umask` removes permissions from the default permissions used when new files and directories are created. With a `umask` of `0002`, group write permission is not removed by the mask.

Typical starting permissions are `666` for regular files and `777` for directories, before the mask is applied. Actual results can depend on the application creating the item.

The `umask` change applies to the current shell and its child processes; it does not permanently change the system-wide setting.

## Exercise 6: Explore the Sticky Bit

Create a temporary shared directory:

```bash
mkdir shared-dir
chmod 1777 shared-dir
ls -ld shared-dir
```

The leading `1` enables the sticky bit. On a shared writable directory, the sticky bit restricts who can delete or rename entries: typically, only the file owner, directory owner, or root can do so.

The `/tmp` directory commonly uses this permission model.

## Cleanup

After completing the exercises, return to a different directory and remove the lab directory:

```bash
cd /
rm -r /tmp/permissions-lab
```

Only run the cleanup command after confirming that `/tmp/permissions-lab` is the temporary directory created for this exercise.

## Key Takeaways

This lab covers Linux permission notation, `chmod`, directory access, `umask`, and the sticky bit. These concepts are important for managing files securely and understanding access control in Linux systems.


## Test Results

Tested on Ubuntu Linux using Bash.

The script successfully demonstrated:

- Changing permissions with `chmod 600` and `chmod 754`.
- Displaying permissions with `ls -l`.
- Checking the current `umask`.
- Adding group read permission.
- Setting the sticky bit on a temporary directory.

All commands completed successfully.
