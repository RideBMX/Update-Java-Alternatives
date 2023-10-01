#!/bin/bash

# Set the path to the JDK bin directory
JDK_BIN_DIR="/usr/lib/jvm/jdk-11/bin"

# Loop through all files in the JDK bin directory
for file_path in $JDK_BIN_DIR/*; do
    # Check if the file is an executable
    if [ -x "$file_path" ]; then
        # Get the executable name without the path
        executable=$(basename "$file_path")

        # Update alternatives for each executable
        update-alternatives --install "/usr/bin/$executable" "$executable" "$file_path" 1
    fi
done
