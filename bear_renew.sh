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

set -e
set +x

# disable system service that will re-spawn docker pod
echo "Disable system service:"
sudo systemctl disable pod-charlesreid1
sudo systemctl stop pod-charlesreid1

echo "Stop pod:"
docker-compose -f /home/charles/pod-charlesreid1/docker-compose.yml down

echo "Run certbot renew:"
sudo /home/charles/certbot/renew_cert.sh

echo "Start pod:"
docker-compose -f /home/charles/pod-charlesreid1/docker-compose.yml up -d

echo "Enable system service:"
sudo systemctl enable pod-charlesreid1
sudo systemctl start pod-charlesreid1

