class prometheus::service inherits prometheus {
    $service_port         = $prometheus::params::service_listening_port
    $prometheus_service   = $prometheus::params::prometheus_service
    $systemd_unit         = $prometheus::params::systemd_unit
    $prometheus_package   = $prometheus::params::prometheus_package

    file { $systemd_unit:
        ensure => file,
        content => template('prometheus/prometheus_service.erb'),
    }

    service { $prometheus_service:
        ensure  => running,
        enable  => true,
        require => Package[$prometheus_package],
    }
}
