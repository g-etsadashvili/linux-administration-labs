#!/bin/bash

# Check whether exactly two arguments were provided
if [ $# -eq 2 ]
then
    # Runs when there are exactly two arguments
    echo "Correct number of arguments"
else
    # Explain the expected usage
    echo "Incorrect number of arguments"
    echo "Usage: $0 <arg1> <arg2>"
fi
