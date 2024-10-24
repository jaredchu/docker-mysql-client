#!/bin/bash

# Default host replacement
DEFAULT_HOST="host.docker.internal"

# Convert "$@" to an array
ARGS=("$@")

# Check if the command already has a -h or --host flag
HOST_FLAG_PRESENT=false
for arg in "${ARGS[@]}"; do
  if [[ "$arg" == "-h"* ]] || [[ "$arg" == "--host"* ]]; then
    HOST_FLAG_PRESENT=true
    break
  fi
done

# If no host flag is found, add the default host to the arguments
if [ "$HOST_FLAG_PRESENT" = false ]; then
  ARGS+=("-h$DEFAULT_HOST")
fi

# Execute the final command with updated arguments
exec "${ARGS[@]}"
