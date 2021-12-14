#!/bin/sh
# sudo chmod -R 777 /tmp/install.sh && sudo /tmp/install.sh
# cd /tmp/ && sudo wget https://raw.githubusercontent.com/quatmo/shairport-sync2-volumio/main/install.sh && sudo chmod -R 777 /tmp/install.sh && sudo /tmp/install.sh
sudo systemctl stop shairport-sync.service
sudo rm /usr/local/bin/shairport-sync
sudo rm /usr/bin/shairport-sync
sudo apt-get update
sudo apt install --no-install-recommends build-essential git xxd xmltoman autoconf automake libtool libpopt-dev libconfig-dev libasound2-dev avahi-daemon libavahi-client-dev libssl-dev libsoxr-dev libplist-dev libsodium-dev libavutil-dev libavcodec-dev libavformat-dev uuid-dev libgcrypt-dev

sync
echo "Download"
mkdir /tmp/shairport2
TMPURL="https://raw.githubusercontent.com/quatmo/shairport-sync2-volumio/main"
TMPPATH="tmp/shairport2"

sudo wget -O /$TMPPATH/nqptp.service.tar.gz $TMPURL/nqptp.service.tar.gz
sudo wget -O /$TMPPATH/nqptp.tar.gz $TMPURL/nqptp.tar.gz
sudo wget -O /$TMPPATH/shairport-service-airplay2.tar.gz $TMPURL/shairport-service-airplay2.tar.gz
sudo wget -O /$TMPPATH/shairport-sync.conf.tar.gz $TMPURL/shairport-sync.conf.tar.gz
sudo wget -O /$TMPPATH/shairport-sync.conf.sample.tar.gz $TMPURL/shairport-sync.conf.sample.tar.gz
sudo wget -O /$TMPPATH/shairport-sync-airplay2.tar.gz $TMPURL/shairport-sync-airplay2.tar.gz

sudo tar -xzvf /$TMPPATH/nqptp.service.tar.gz --overwrite -C /
sudo tar -xzvf /$TMPPATH/nqptp.tar.gz --overwrite -C /
sudo tar -xzvf /$TMPPATH/shairport-service-airplay2.tar.gz --overwrite -C /
sudo tar -xzvf /$TMPPATH/shairport-sync.conf.tar.gz --overwrite -C /
sudo tar -xzvf /$TMPPATH/shairport-sync.conf.sample.tar.gz --overwrite -C /
sudo tar -xzvf /$TMPPATH/shairport-sync-airplay2.tar.gz --overwrite -C /

sudo systemctl daemon-reload
sudo systemctl enable nqptp.service
sudo systemctl restart nqptp.service
sudo systemctl enable shairport-sync.service
sudo systemctl restart shairport-sync.service
sync
echo "Install OK"
sudo systemctl status shairport-sync.service

