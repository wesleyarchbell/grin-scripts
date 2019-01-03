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

### Grin Node
* cd ~
* git clone https://github.com/mimblewimble/grin
* cd grin
* cargo build --release
* cd target/release
* vi grin-server.toml
    * Update: enable_stratum_server = true
* RUST_BACKTRACE=1 ./grin --floonet (or use ~/grin-scripts/run-grin.sh)

### Grin Wallet
* From a seperate tab in google cloud console run following commands: 
    * gcloud compute firewall-rules create grin-wallet-port --direction=INGRESS --action=ALLOW --rules=tcp:13415 --target-tags=grin-node
    * gcloud compute instances list (take not of the external_ip_address)
* vi ~/.grin/floo/grin-wallet.toml
    * Update: api_listen_interface = 0.0.0.0
* cd ~/grin/target/release    
* RUST_BACKTRACE=1 ./grin --floonet wallet init
    * Type in a password for your wallet (record this for later use)
* RUST_BACKTRACE=1 ./grin --floonet wallet listen (or use ~/grin-scripts/run-wallet.sh)
    * Type in your wallet password
* In your browser; go to https://www.yougetsignal.com/tools/open-ports/
    * Type in external ip from the command (gcloud compute instances list)
    * Type in port 13415
    * Hit check button
    * It should should be able to connect and say port is open
* Your wallet can now receive coins at the following URL: http://<external_ip_address>:13415
* Command to send grin to another wallet:
   * cd ~/grin/target/release
   * RUST_BACKTRACE=1 ./grin --floonet wallet send -d http://35.243.222.227:13415 <amount>
   * Type in wallet password
   * The -d option is the destination wallet's address and port
   

### Grin Miner
* cd ~
* git clone https://github.com/mimblewimble/grin-miner
* cd grin-miner
* git submodule update --init
* git submodule update --remote --recursive
* cargo build
* vi grin-miner.toml (in order to mine with CPU on google cloud instance)
    * Replace 'cuckaroo_cpu_compat_29' with 'cuckatoo_lean_cpu_compat_19'
    * nthreads = 4
* target/debug/grin-miner --floonet (or use ~/grin-scripts/run-miner.sh)



