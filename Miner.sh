#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install necessary dependencies
sudo apt install build-essential autoconf libtool libssl-dev libboost-all-dev libdb-dev libdb++-dev libevent-dev -y

# Install necessary tools for building Bitcoin Core
sudo apt install libdb5.3-dev libdb5.3++-dev libminiupnpc-dev -y

# Download Bitcoin Core source code
git clone https://github.com/bitcoin/bitcoin.git
cd bitcoin

# Configure Bitcoin Core for building
./autogen.sh
./configure --with-in-place --with-libsdb --with-gmp=no

# Build Bitcoin Core
make

# Install Bitcoin Core
sudo make install

# Download and install Bitcoin Core documentation
git clone https://github.com/bitcoin-core/docs.git
sudo mv docs /var/www/html/bitcoin-docs

# Start Bitcoin Core
bitcoind

echo "Bitcoin Core installed and running."
