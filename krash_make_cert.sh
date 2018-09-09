#!/bin/bash
#
# renew/run certbot on krash

if [ "$(id -u)" != "0" ]; then
    echo ""
    echo ""
    echo "This script should be run as root."
    echo ""
    echo ""
    exit 1;
fi

set +x 

# disable system service that will re-spawn docker pod
echo "Disable system service:"
sudo systemctl disable dockerpod-charlesreid1
sudo systemctl stop dockerpod-charlesreid1

echo "Stop pod:"
docker-compose -f $HOME/codes/docker/pod-charlesreid1/docker-compose.yml down

echo "Run certbot create:"
sudo ./make_cert.sh

echo "Start pod:"
docker-compose -f $HOME/codes/docker/pod-charlesreid1/docker-compose.yml up -d

echo "Enable system service:"
sudo systemctl enable dockerpod-charlesreid1

set -x
