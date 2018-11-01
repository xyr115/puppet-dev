class prometheus::service {
    file { '/etc/systemd/system/prometheus.service':
      notify => Service['prometheus'],
      source => 'puppet:///modules/prometheus/prometheus.service',
    }

    service { 'prometheus':
      ensure  => running,
      enable  => true,
      require => Package['prometheus'],
    }
}
