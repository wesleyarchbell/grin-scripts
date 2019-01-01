#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
pushd $SCRIPT_DIR/../grin/target/release
echo "Running wallet:listen..."
RUST_BACKTRACE=1 ./grin --floonet wallet listen
