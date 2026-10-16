
#!/bin/bash

# Linux File Permissions and Access Control Lab

LAB_DIR="/tmp/permissions-lab"

echo "=== Linux Permissions Lab ==="

# Create a temporary lab directory
mkdir -p "$LAB_DIR"
cd "$LAB_DIR" || exit 1

# Create test files
touch file1.txt file2.txt

echo
echo "1. Initial file permissions:"
ls -l

# Set permissions using numeric notation
chmod 600 file1.txt
chmod 754 file2.txt

echo
echo "2. Permissions after chmod:"
ls -l

# Display the current umask
echo
echo "3. Current umask:"
umask

# Demonstrate symbolic permission changes
chmod g+r file1.txt

echo
echo "4. Permissions after adding group read access:"
ls -l file1.txt

# Demonstrate the sticky bit on a temporary directory
mkdir shared-dir
chmod 1777 shared-dir

echo
echo "5. Sticky bit directory permissions:"
ls -ld shared-dir

echo
echo "Lab completed."
echo "Files created in: $LAB_DIR"
echo "To remove the lab directory, run:"
echo "rm -r /tmp/permissions-lab"
