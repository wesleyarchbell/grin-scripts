#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
pushd $SCRIPT_DIR/../grin-miner
echo "Starting grin miner..."
target/debug/grin-miner --floonet
