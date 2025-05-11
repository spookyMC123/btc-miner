#!/bin/bash

echo "🔄 সিস্টেম আপডেট করা হচ্ছে..."
sudo apt update

echo "📦 প্রয়োজনীয় প্যাকেজ ইনস্টল করা হচ্ছে..."
sudo apt install -y build-essential autoconf libtool pkg-config libcurl4-openssl-dev libncurses5-dev libudev-dev libusb-1.0-0-dev git

echo "⬇️ CGMiner ক্লোন করা হচ্ছে..."
git clone https://github.com/ckolivas/cgminer.git

cd cgminer

echo "⚙️ CGMiner কম্পাইল করা হচ্ছে..."
./autogen.sh
./configure
make

echo "🚀 Kryptex পুলে মাইনিং শুরু করা হচ্ছে..."
./cgminer -o stratum+tcp://btc.kryptex.network:7777 -u krxYEJMNE6.worker -p x
