# grin-scripts

## Simple scripts in order to run:

* grin node: run-grin.sh
* grin wallet: run-wallet.sh
* grin miner: run-miner.sh

### Grin scripts
* cd ~
* git clone https://github.com/wesleyarchbell/grin-scripts
* cd grin-scripts
* chmod +x * 

## Steps to setup grin node, wallet & miner:

### Grin
* cd ~
* git clone https://github.com/mimblewimble/grin
* cd grin
* cargo build --release
* cd target/release
* vi grin-server.toml
* Change: enable_stratum_server = true
* RUST_BACKTRACE=1 ./grin --floonet (or use ~/grin-scripts/run-grin.sh)

### Grin Wallet
* cd ~
* cd grin/target/release
* cd ~/.grin/floo
* vi grin-wallet.toml
* api_listen_interface = 0.0.0.0
* From a seperate tab in google cloud console run following commands: 
    * gcloud compute firewall-rules create grin-wallet-port --direction=INGRESS --action=ALLOW --rules=tcp:13415 --target-tags=grin-node
    * gcloud compute instances list
* RUST_BACKTRACE=1 ./grin --floonet wallet init
* RUST_BACKTRACE=1 ./grin --floonet wallet listen (or use ~/grin-scripts/run-wallet.sh)
* Go to https://www.yougetsignal.com/tools/open-ports/
* Type in external ip from the command (gcloud compute instances list)
* Type in port 13415
* Hit check button
* It should should be able to connect and say port is open
* Your wallet can now receive coins at http://<external_ip_address>:13415

### Grin Miner
* cd ~
* git clone https://github.com/mimblewimble/grin-miner
* git submodule update --remote --recursive
* cargo build
* target/debug/grin-miner --floonet (or use ~/grin-scripts/run-miner.sh)



