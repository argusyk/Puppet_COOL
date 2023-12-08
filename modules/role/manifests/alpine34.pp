class role::alpine34 {
    class { 'profile::alpine33':
        status => 'absent',
    }

    class { 'profile::alpine34':
        status => 'present',
    }
}