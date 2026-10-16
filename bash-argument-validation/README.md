# Bash Argument Validation Lab

## Overview

This project demonstrates basic Bash scripting and command-line argument validation using Ubuntu Linux.

The script checks whether exactly two command-line arguments are provided and displays an appropriate message.

## Environment

- Operating system: Ubuntu Linux
- Shell: Bash
- Script: `check_arguments.sh`

## What I Implemented

The Bash script uses:

- `#!/bin/bash` to specify the Bash interpreter.
- `$#` to count command-line arguments.
- `if`, `then`, `else`, and `fi` for conditional execution.
- `-eq` to compare the number of arguments.
- `echo` to display messages.
- `$0` to display the script name or path in the usage message.

## Testing

The script was tested successfully in Ubuntu Linux.

### Test 1 — Correct number of arguments

Command:

```bash
bash bash-argument-validation/check_arguments.sh hello world
```

Expected output:

```text
Correct number of arguments
```

### Test 2 — Incorrect number of arguments

Command:

```bash
bash bash-argument-validation/check_arguments.sh hello
```

Expected output:

```text
Incorrect number of arguments
Usage: bash-argument-validation/check_arguments.sh <arg1> <arg2>
```

The usage message includes the script path supplied when running the script.

## Concepts Practised

- Bash scripting
- Command-line arguments
- Special variables `$#` and `$0`
- Conditional statements
- Numeric comparisons
- Input validation
- Usage and error messages

## Purpose

This lab demonstrates foundational Bash scripting skills developed during my Linux 1 studies.

The project includes the working script [`check_arguments.sh`](check_arguments.sh), which can be extended with additional validation features in the future.
