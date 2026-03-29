#!/bin/bash
# Script 4: Log File Analyzer
# Author: TEJASVA MIDHA | Course: Open Source Software
# Usage: ./script4_log_analyzer.sh /var/log/syslog [keyword]
# Purpose: Count keyword occurrences line-by-line and show last 5 matching lines.

LOGFILE="$1"
KEYWORD="${2:-error}"   # Default keyword is 'error'
COUNT=0

# --- Validate input ---
if [ -z "$LOGFILE" ]; then
  echo "Usage: $0 /path/to/logfile [keyword]"
  exit 1
fi

if [ ! -f "$LOGFILE" ]; then
  echo "Error: File $LOGFILE not found."
  exit 1
fi

# --- do-while style retry if file is empty ---
TRIES=0
MAX_TRIES=3
while :; do
  LINES="$(wc -l < "$LOGFILE")"
  if [ "$LINES" -gt 0 ]; then
    break
  fi

  TRIES=$((TRIES + 1))
  echo "Warning: $LOGFILE is empty (try $TRIES/$MAX_TRIES). Retrying in 2 seconds..."
  sleep 2

  if [ "$TRIES" -ge "$MAX_TRIES" ]; then
    echo "Error: $LOGFILE is still empty after $MAX_TRIES tries."
    exit 1
  fi
done

# --- Analyze line by line (while-read loop) ---
while IFS= read -r LINE; do
  if echo "$LINE" | grep -iq "$KEYWORD"; then
    COUNT=$((COUNT + 1))
  fi
done < "$LOGFILE"

echo "-------------------------------------------"
echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo "-------------------------------------------"

# --- Show last 5 matching lines ---
echo "Last 5 matching lines:"
MATCHES="$(grep -i "$KEYWORD" "$LOGFILE" | tail -n 5)"
if [ -n "$MATCHES" ]; then
  echo "$MATCHES"
else
  echo "(No matching lines found.)"
fi