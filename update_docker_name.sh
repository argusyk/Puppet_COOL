#!/bin/bash
# Define a new hostname that includes "alpine34"
# instead of "alpine33".
export new_hostname="foo-alpine34"
MODULEPATH=/etc/puppetlabs/code/environments/production/modules
MANIFESTFILE=/vagrant/manifests/site.pp

sudo --preserve-env --host=localhost -- sed --in-place "s/${HOSTNAME}/${new_hostname}/g" /etc/hostname /etc/hosts
sudo --preserve-env --host=localhost -- hostname "$new_hostname"

#exec "$SHELL"

# Rerun the manifest using the new node name.
puppet apply --modulepath $MODULEPATH $MANIFESTFILE

# Show the Alpine images installed.
sudo docker images alpine
sudo docker ps
