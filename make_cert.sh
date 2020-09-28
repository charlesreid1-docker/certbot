#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo ""
    echo ""
    echo "This script should be run as root."
    echo ""
    echo ""
    exit 1;
fi



##############
# Domains
##############

#DOMS="charlesreid1.red charlesreid1.blue charlesreid1.com"
#DOMS="charlesreid1.red"
#DOMS="charlesreid1.blue"
DOMS="charlesreid1.com"

for DOM in $DOMS; do

    ## Fake:
    #echo certbot certonly \
    #    --standalone \
    #    --non-interactive \
    #    --agree-tos \
    #    --email charles@charlesreid1.com \
    #    -d ${DOM}

    # Real:
    set -x
    certbot certonly \
        --standalone \
        --non-interactive \
        --agree-tos \
        --email charles@charlesreid1.com \
        -d ${DOM}
    set +x

done



##############
# Subdomains
##############

#DOMS="charlesreid1.com charlesreid1.blue charlesreid1.red"
#DOMS="charlesreid1.red"
DOMS="charlesreid1.com"
SUBS="git www"

# Subdomains
for SUB in $SUBS; do
    for DOM in $DOMS; do

        ## Fake:
        #echo certbot certonly \
        #    --standalone \
        #    --non-interactive \
        #    --agree-tos \
        #    --email charles@charlesreid1.com \
        #    -d ${SUB}.${DOM}

        # Real:
        set -x
        certbot certonly \
            --standalone \
            --non-interactive \
            --agree-tos \
            --email charles@charlesreid1.com \
            -d ${SUB}.${DOM}
        set +x

    done
done
