#!/bin/bash -e

conjurize --sudo --ssh <host.json | \
    ssh -p 2222 \
        -i .vagrant/machines/default/virtualbox/private_key \
        vagrant@docker.for.mac.localhost
