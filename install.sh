#!/bin/sh
# sudo chmod -R 777 /tmp/AirPlay2/install.sh && sudo /tmp/AirPlay2/install.sh

sudo systemctl stop shairport-sync.service
sudo rm /usr/local/bin/shairport-sync
sudo rm /usr/bin/shairport-sync

sudo apt install --no-install-recommends build-essential git xxd xmltoman autoconf automake libtool libpopt-dev libconfig-dev libasound2-dev avahi-daemon libavahi-client-dev libssl-dev libsoxr-dev libplist-dev libsodium-dev libavutil-dev libavcodec-dev libavformat-dev uuid-dev libgcrypt-dev

sync
echo "Download"
mkdir /tmp/shairport2
TMPURL="https://raw.githubusercontent.com/quatmo/shairport-sync2-volumio/main"
TMPPATH="tmp/shairport2"

wget -O /$TMPPATH/ $TMPURL/nqptp.service.tar.gz
wget -O /$TMPPATH/ $TMPURL/nqptp.tar.gz
wget -O /$TMPPATH/ $TMPURL/shairport-service-airplay2.tar.gz
wget -O /$TMPPATH/ $TMPURL/shairport-sync.conf.tar.gz
wget -O /$TMPPATH/ $TMPURL/shairport-sync.conf.sample.tar.gz
wget -O /$TMPPATH/ $TMPURL/shairport-sync-airplay2.tar.gz

sudo tar -xzvf /$TMPPATH/nqptp.service.tar.gz --overwrite -C /
sudo tar -xzvf /$TMPPATH/nqptp.tar.gz --overwrite -C /
sudo tar -xzvf /$TMPPATH/shairport-service-airplay2.tar.gz --overwrite -C /
sudo tar -xzvf /$TMPPATH/shairport-sync.conf.tar.gz --overwrite -C /
sudo tar -xzvf /$TMPPATH/shairport-sync.conf.sample.tar.gz --overwrite -C /
sudo tar -xzvf /$TMPPATH/shairport-sync-airplay2.tar.gz --overwrite -C /

# sudo systemctl daemon-reload
# sudo systemctl enable shairport-sync.service
# sudo systemctl restart shairport-sync.service
# sync
# echo "Install OK"
# sudo systemctl status shairport-sync.service

