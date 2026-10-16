#!/bin/bash

# Check whether exactly two arguments were provided
if [ $# -eq 2 ]
then
    # Runs when there are exactly two arguments
    echo "Correct number of arguments"
else
    # Runs when the number of arguments is not two
    echo "Incorrect number of arguments"
fi
