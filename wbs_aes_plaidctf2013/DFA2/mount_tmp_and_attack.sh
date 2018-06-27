#!/bin/bash

mkdir -p tmp
mount|grep -q $(pwd)/tmp || sudo mount -t tmpfs -o mode=01777,size=20m tmpfs tmp
cp attack_plaidctf.py spawn_drmless.py ../../deadpool_dfa.py ../../../JeanGrey/phoenixAES.py tmp
cp ../target/drmless tmp/drmless.gold
cd tmp
./attack_plaidctf.py
