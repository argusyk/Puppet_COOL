class role::alpine33 {
    class { 'profile::alpine33':
        status => 'present',
    }

    class { 'profile::alpine34':
        status => 'absent',
    }
}