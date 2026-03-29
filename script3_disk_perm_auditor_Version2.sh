#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: TEJASVA MIDHA | Course: Open Source Software
# Purpose: Loop through important directories and report size + permissions/owner/group.
#          Also checks Firefox config/profile directories.

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Directory Audit Report"
echo "----------------------"

for DIR in "${DIRS[@]}"; do
  if [ -d "$DIR" ]; then
    # ls -ld prints perms/owner/group; awk extracts needed fields
    PERMS_OWNER_GROUP="$(ls -ld "$DIR" | awk '{print $1, $3, $4}')"
    # du -sh shows total size; cut extracts size column
    SIZE="$(du -sh "$DIR" 2>/dev/null | cut -f1)"
    echo "$DIR => Permissions/Owner/Group: $PERMS_OWNER_GROUP | Size: $SIZE"
  else
    echo "$DIR does not exist on this system"
  fi
done

echo ""
echo "Firefox Config Directory Checks"
echo "-------------------------------"

# Typical Firefox profile/config locations
FIREFOX_USER_DIR="$HOME/.mozilla"
FIREFOX_PROFILE_DIR="$HOME/.mozilla/firefox"
FIREFOX_SNAP_PROFILE_DIR="$HOME/snap/firefox/common/.mozilla/firefox"

for C in "$FIREFOX_USER_DIR" "$FIREFOX_PROFILE_DIR" "$FIREFOX_SNAP_PROFILE_DIR"; do
  if [ -d "$C" ]; then
    echo "$C => $(ls -ld "$C" | awk '{print $1, $3, $4}')"
  else
    echo "$C not found (Firefox may not be launched yet, or install method differs)."
  fi
done