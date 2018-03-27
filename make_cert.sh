#!/bin/bash
#
# Just a script to make an SSL cert "manually"

if [ "$(id -u)" != "0" ]; then
    echo ""
    echo ""
    echo "This script should be run as root."
    echo ""
    echo ""
    exit 1;
fi

DOM="charlesreid1.blue"

certbot certonly \
    --staging \
    --standalone \
    --non-interactive \
    --agree-tos \
    --email charles@charlesreid1.com \
    -d ${DOM} \
    -d www.${DOM} \
    -d git.${DOM} 
