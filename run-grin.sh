#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
pushd $SCRIPT_DIR/../grin/target/release
echo "Running grin node..."
RUST_BACKTRACE=1 ./grin --floonet
