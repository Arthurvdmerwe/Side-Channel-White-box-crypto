#!/bin/bash

mkdir -p tmp
mount|grep -q $(pwd)/tmp || sudo mount -t tmpfs -o mode=01777,size=20m tmpfs tmp
cp attack_nsc.py ../../deadpool_dfa.py ../../../JeanGrey/phoenixAES.py tmp
cp ../target/nosuchcon_2013_whitebox_allenc.c ../target/nosuchcon_2013_whitebox_allenc_generator.c tmp
cd tmp
gcc -o nosuchcon_2013_whitebox_allenc_generator nosuchcon_2013_whitebox_allenc_generator.c
gcc -o nosuchcon_2013_whitebox_allenc nosuchcon_2013_whitebox_allenc.c
./nosuchcon_2013_whitebox_allenc_generator
mv wbt_allenc wbt_allenc.gold
./attack_nsc.py
