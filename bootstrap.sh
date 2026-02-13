#!/bin/bash
# bootstrap.sh - run from fresh machine
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

OS=$(uname)
if [[ "$OS" == "Darwin" ]]; then
    ./scripts/installMacos.sh
elif [[ "$OS" == "Linux" ]]; then
    ./scripts/installArch.sh
fi