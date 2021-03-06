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



##############
# Domains
##############

DOMS="charlesreid1.red"
#
for DOM in $DOMS; do

    # Fake:
    echo certbot certonly \
        --standalone \
        --non-interactive \
        --agree-tos \
        --email charles@charlesreid1.com \
        -d ${DOM}

    ## Real:
    #certbot certonly \
    #    --standalone \
    #    --non-interactive \
    #    --agree-tos \
    #    --email charles@charlesreid1.com \
    #    -d ${DOM}

done



##############
# Subdomains
##############

DOMS="charlesreid1.red"
SUBS="git pages www hooks bots"

# Subdomains
for SUB in $SUBS; do
    for DOM in $DOMS; do

        # Fake:
        echo certbot certonly \
            --standalone \
            --non-interactive \
            --agree-tos \
            --email charles@charlesreid1.com \
            -d ${SUB}.${DOM}

        ## Real:
        #certbot certonly \
        #    --standalone \
        #    --non-interactive \
        #    --agree-tos \
        #    --email charles@charlesreid1.com \
        #    -d ${SUB}.${DOM}

    done
done

set +x

