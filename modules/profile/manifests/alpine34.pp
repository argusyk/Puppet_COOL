# The "alpine34" profile manages the presence or
# absence of the Alpine 3.4 Docker image. By
# default, it will remove the image.

class profile::alpine34 ($status = 'absent') {
    include docker
    docker::image { 'alpine_34':
        image     => 'alpine',
        image_tag => '3.4',
        ensure    => $status,
    }    
}
