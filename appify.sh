#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: appify path_to_app"
    exit 1
fi

# Get the path to the app from the argument
APP_PATH="$1"

# Execute the xattr and codesign commands
xattr -cr "$APP_PATH" && codesign --force --deep --sign - "$APP_PATH"

# Check if the commands were successful
if [ $? -eq 0 ]; then
    echo "Successfully applied appify to $(basename "$APP_PATH")"
else
    echo "Failed to appify $(basename "$APP_PATH")"
fi

