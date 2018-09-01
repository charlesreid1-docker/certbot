#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo ""
    echo ""
    echo "This script should be run as root."
    echo ""
    echo ""
    exit 1;
fi

set -x

certbot certonly \
    --standalone \
    --non-interactive \
    --agree-tos \
    --email charlesreid1.dib@gmail.com \
    -d search.nihdatacommons.us

set +x
