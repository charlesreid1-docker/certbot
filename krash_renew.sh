#!/bin/bash
#
# renew/run certbot on krash

set +x 

if [ "$(id -u)" != "0" ]; then
    echo ""
    echo ""
    echo "This script should be run as root."
    echo ""
    echo ""
    exit 1;
fi

# disable system service that will re-spawn docker pod
echo "Disable system service:"
sudo systemctl disable dockerpod-charlesreid1
sudo systemctl stop dockerpod-charlesreid1

echo "Stop pod:"
docker-compose -f /home/charles/codes/docker/pod-charlesreid1/docker-compose.yml down

echo "Run certbot renew:"
sudo ./renew_cert.sh

echo "Start pod:"
docker-compose -f /home/charles/codes/docker/pod-charlesreid1/docker-compose.yml up -d

echo "Enable system service:"
sudo systemctl enable dockerpod-charlesreid1
sudo systemctl start dockerpod-charlesreid1

set -x

