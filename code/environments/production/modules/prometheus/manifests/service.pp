class prometheus::service {
    file { '/etc/systemd/system/prometheus.service':
        source => 'puppet:///modules/prometheus/prometheus.service',
    }

    service { 'prometheus':
        ensure  => running,
        enable  => true,
        require => Package['prometheus'],
    }
}
