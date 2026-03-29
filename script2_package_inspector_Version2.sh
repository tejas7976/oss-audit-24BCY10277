#!/bin/bash
# Script 2: FOSS Package Inspector (Ubuntu-focused)
# Author: TEJASVA MIDHA | Course: Open Source Software
# Purpose: Check if software is installed, show version info, and print a philosophy note.

PACKAGE="${1:-firefox}"

# --- Helper functions ---
is_installed_apt() {
  # dpkg -s returns 0 if installed
  dpkg -s "$1" &>/dev/null
}

is_installed_snap() {
  # Check whether a snap is installed by name
  snap list 2>/dev/null | awk '{print $1}' | grep -qx "$1"
}

echo "=============================================="
echo " FOSS Package Inspector"
echo "=============================================="
echo "Package/App: $PACKAGE"
echo ""

FOUND=0

# --- APT check ---
if is_installed_apt "$PACKAGE"; then
  FOUND=1
  echo "[APT] $PACKAGE is installed."
  VERSION="$(dpkg-query -W -f='${Version}\n' "$PACKAGE" 2>/dev/null)"
  SUMMARY="$(apt-cache show "$PACKAGE" 2>/dev/null | awk -F': ' '/^Description-en:|^Description:/{print $2; exit}')"
  echo "Version : ${VERSION:-Unknown}"
  echo "Summary : ${SUMMARY:-Unknown}"
fi

# --- Snap check (Firefox is commonly snap on Ubuntu) ---
if [ "$PACKAGE" = "firefox" ] && is_installed_snap "firefox"; then
  FOUND=1
  echo "[SNAP] firefox is installed."
  INSTALLED_LINE="$(snap info firefox 2>/dev/null | awk -F': ' '/^installed:/{print $2; exit}')"
  TRACKING_LINE="$(snap info firefox 2>/dev/null | awk -F': ' '/^tracking:/{print $2; exit}')"
  echo "Installed : ${INSTALLED_LINE:-Unknown}"
  echo "Tracking  : ${TRACKING_LINE:-Unknown}"
fi

if [ $FOUND -eq 0 ]; then
  echo "$PACKAGE is NOT installed (checked APT and Snap)."
fi

echo ""
echo "---- Philosophy note (case statement) ----"
case "$PACKAGE" in
  firefox)
    echo "Firefox: a community-driven browser that defends an open, standards-based web."
    ;;
  git)
    echo "Git: distributed version control that enables transparent collaboration."
    ;;
  vlc)
    echo "VLC: free software that prioritizes open formats and user freedom."
    ;;
  apache2|httpd)
    echo "Apache: an open web server that helped build the public internet."
    ;;
  *)
    echo "Open source: the freedom to study, modify, and share tools with others."
    ;;
esac

echo "=============================================="