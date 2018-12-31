#!/bin/bash
pushd ../grin-miner
echo "Starting grin miner..."
target/debug/grin-miner --floonet
