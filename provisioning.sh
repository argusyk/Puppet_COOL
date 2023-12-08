#!/bin/bash
MODULEPATH=/etc/puppetlabs/code/environments/production/modules
MANIFESTFILE=/vagrant/manifests/site.pp
MODULES=/vagrant/modules

apt-get install puppet-agent -y
systemctl enable puppet
systemctl start puppet
export PATH=$PATH:/opt/puppetlabs/puppet/bin
gem install librarian-puppet
puppet module install puppetlabs-docker
ln -s $MODULES/* $MODULEPATH
puppet apply --modulepath $MODULEPATH $MANIFESTFILE


