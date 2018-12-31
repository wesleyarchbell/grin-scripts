#!/bin/bash
pushd ../grin/target/release
echo "Running wallet:listen..."
RUST_BACKTRACE=1 ./grin --floonet wallet listen
