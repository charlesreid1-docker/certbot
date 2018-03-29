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

# add the --staging flag to make this a fake dry run

# -----

DOM="charlesreid1.red"

## success!
#certbot certonly \
#    --standalone \
#    --non-interactive \
#    --agree-tos \
#    --email charles@charlesreid1.com \
#    -d ${DOM}

## success!
#certbot certonly \
#    --standalone \
#    --non-interactive \
#    --agree-tos \
#    --email charles@charlesreid1.com \
#    -d git.${DOM}

## FAIL - fix when domain name records are fixed
#certbot certonly \
#    --standalone \
#    --non-interactive \
#    --agree-tos \
#    --email charles@charlesreid1.com \
#    -d www.${DOM}

## TODO
#certbot certonly \
#    --standalone \
#    --non-interactive \
#    --agree-tos \
#    --email charles@charlesreid1.com \
#    -d pages.${DOM}

# -----

DOM="charlesreid1.blue"

## success!
#certbot certonly \
#    --standalone \
#    --non-interactive \
#    --agree-tos \
#    --email charles@charlesreid1.com \
#    -d ${DOM}

## success!
#certbot certonly \
#    --standalone \
#    --non-interactive \
#    --agree-tos \
#    --email charles@charlesreid1.com \
#    -d git.${DOM}

## success!
#certbot certonly \
#    --standalone \
#    --non-interactive \
#    --agree-tos \
#    --email charles@charlesreid1.com \
#    -d www.${DOM}

## TODO
#certbot certonly \
#    --standalone \
#    --non-interactive \
#    --agree-tos \
#    --email charles@charlesreid1.com \
#    -d pages.${DOM}

