#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: TEJASVA MIDHA | Course: Open Source Software
# Purpose: Ask 3 questions, generate a short manifesto paragraph, save to a .txt file.
#
# Alias concept demo (comment only):
# Example: alias ll='ls -alF'

echo "Answer three questions to generate your manifesto."
echo ""

# Interactive user input
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE="$(date '+%Y-%m-%d')"
TIME="$(date '+%H:%M:%S')"
OUTPUT="manifesto_$(whoami)_${DATE}.txt"

# Compose paragraph using answers (string concatenation via variables)
PARA="On ${DATE} at ${TIME}, I reaffirm that open source matters to me because it turns users into contributors. \
The tool I rely on every day is '${TOOL}', and it reminds me that transparency creates trust. \
To me, freedom means '${FREEDOM}'—the ability to learn from how things work and improve them without asking permission. \
If I could build one thing and share it freely, it would be '${BUILD}', so others can adapt it to their needs and pass it forward."

# Write to file using > and >>
echo "Open Source Manifesto" > "$OUTPUT"
echo "---------------------" >> "$OUTPUT"
echo "$PARA" >> "$OUTPUT"

echo ""
echo "Manifesto saved to: $OUTPUT"
echo ""
cat "$OUTPUT"