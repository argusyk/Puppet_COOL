####################################################
# Profiles
####################################################
# The "dockerd" profile uses a forge module to
# install and manage the Docker daemon. The only
# difference between this and the "docker" class
# from the earlier docker.pp example is that we're
# wrapping it inside a profile.
class profile {
    include docker
    include profile::dockerd
    include profile::alpine33
    include profile::alpine34
}





