#!/bin/bash

# Compile for x86_64 architecture
swiftc -target x86_64-apple-macos13 -o nomouse_x86_64 main.swift

# Compile for arm64 architecture
swiftc -target arm64-apple-macos13 -o nomouse_arm64 main.swift

# Combine the x86_64 and arm64 binaries into a universal binary
lipo -create -output nomouse nomouse_x86_64 nomouse_arm64

# Verify the architecture of the universal binary
lipo -info nomouse

# Remove arm64 and x86_64 binaries
rm nomouse_x86_64
rm nomouse_arm64