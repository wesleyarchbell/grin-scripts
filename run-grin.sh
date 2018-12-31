#!/bin/bash
pushd grin/target/release
echo "Running grin node..."
RUST_BACKTRACE=1 ./grin --floonet
