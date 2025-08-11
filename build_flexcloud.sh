#!/bin/bash

# FlexCloud build script
# This script builds the FlexCloud project using CMake

set -e  # Exit on any error

echo "Building FlexCloud..."

# Create build directory and configure
cmake -S /dev_ws/src/flexcloud -B /dev_ws/build

# Build the project
cmake --build /dev_ws/build -j 10

echo "FlexCloud build completed successfully!"