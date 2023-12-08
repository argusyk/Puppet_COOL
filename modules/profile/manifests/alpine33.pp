# The "alpine33" profile manages the presence or
# absence of the Alpine 3.3 Docker image using a
# parameterized class. By default, it will remove
# the image.

class profile::alpine33 ($status = 'absent') {
    include docker
    docker::image { 'alpine_33':
        image     => 'alpine',
        image_tag => '3.3',
        ensure    => $status,
    }     
}