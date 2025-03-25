#!/bin/bash

# If brew exists install all wanted packages.
if command -v brew &> /dev/null; then
    # Disable quarantine
    export HOMEBREW_CASK_OPTS=--no-quarantine

    # Install everything in Brewfile
    brew bundle --file ~/.bootstrap/Brewfile
fi
