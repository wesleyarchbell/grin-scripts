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
* If grin-server.toml does not exist in this directory run this command to generate one:
    * RUST_BACKTRACE=1 ./grin --floonet server config
* vi grin-server.toml 
    * Update: enable_stratum_server = true
* RUST_BACKTRACE=1 ./grin --floonet (or use ~/grin-scripts/run-grin.sh)

#### Grin Links
* https://github.com/mimblewimble/grin
* https://github.com/mimblewimble/docs/wiki/How-to%3A-Run-a-Grin-node-on-Google-Cloud-for-free

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
* Command to see account balance information related to your wallet:
   * cd ~/grin/target/release
   * RUST_BACKTRACE=1 ./grin --floonet wallet info
   * Type in wallet password
* Command to see transaction history related to your wallet:
   * cd ~/grin/target/release
   * RUST_BACKTRACE=1 ./grin --floonet wallet txs
   * Type in wallet password   
   
#### Grin Wallet Links
* https://github.com/mimblewimble/docs/wiki/Wallet-User-Guide

### Grin Miner
* cd ~
* git clone https://github.com/mimblewimble/grin-miner
* cd grin-miner
* git submodule update --init
* git submodule update --remote --recursive
* cargo build
* vi grin-miner.toml (in order to mine with CPU on google cloud instance)
    * Replace 'cuckaroo_cpu_compat_29' with 'cuckatoo_mean_cpu_compat_19'
    * nthreads = 4
* target/debug/grin-miner --floonet (or use ~/grin-scripts/run-miner.sh)

#### Grin Mining Links

* https://github.com/mimblewimble/grin-miner
* https://github.com/mozkomor/GrinGoldMiner
* https://github.com/tromp/cuckoo
* https://github.com/mimblewimble/docs/wiki/Wallet-User-Guide
* https://youtu.be/Y-kF9RnkeJo
* https://www.grin-forum.org/c/mining
* https://github.com/mimblewimble/docs/wiki/GPU-Mining-Stats
* https://www.grin-forum.org/t/what-to-mine-choosing-between-cuckatoo31-and-cuckaroo29/1732

#### Grin Mining Pool Links
* MWGrinPool.com (https://mwgrinpool.com/)
    * https://github.com/grin-pool/grin-pool     
    * https://medium.com/@blade.doyle/gpu-mining-on-mwgrinpool-com-how-to-72970e550a27
    * https://www.youtube.com/watch?v=eRtzwo6W8iE
* GrinMint (https://grinmint.com/pages/index.html)   
    * https://www.reddit.com/r/grincoin/comments/adwb3e/mining_grin_on_grinmint_a_stepbystep_tutorial/?st=JQO882M3&sh=b0b4b67d




