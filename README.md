# certbot

This repo contains scripts for doing common tasks with certbot.

There are two main scripts to perform the cert update with certbot,
these scripts are where the domains and subdomains are specified:

* `make_cert.sh` - makes a new certificate for the given domains/subdomains
* `renew_cert.sh` - renews a certificate for the given domains/subdomains

The user should not call these directly, however, because the docker pod
running the site will interfere with the renewal process. Rather, use a
wrapper script that stops the docker pod before renewing the cert, and starts
it back up when finished.

See `bear_make_cert.sh` and `bear_renew.sh` for example.

