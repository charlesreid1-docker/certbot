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

DOMS="charlesreid1.red charlesreid1.blue charlesreid1.com"
#SUBS="www git pages files"
#SUBS="hooks bots"
SUBS="api"

for SUB in $SUBS; do
    for DOM in $DOMS; do
        echo certbot certonly \
            --standalone \
            --non-interactive \
            --agree-tos \
            --email charles@charlesreid1.com \
            -d ${SUB}.${DOM}
    done
done

set +x
