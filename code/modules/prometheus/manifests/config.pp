class prometheus::config inherits prometheus {
  $service_port         = $prometheus::params::service_listening_port
  $prometheus_service   = $prometheus::params::prometheus_service
  $config_file          = $prometheus::params::config_file
  $host_addr            = $prometheus::params::host_addr
  $alert_rules          = $prometheus::params::alert_rules

  file { $alert_rules:
    ensure  => file,
    content => template('prometheus/alert_rules.erb'),
    notify  => Service[$prometheus_service],
  }

  file { $config_file:
    ensure   => file,
    mode     => '0644',
    owner    => 'root',
    group    => 'root',
    content  => template('prometheus/prometheus_configuration.erb'),
    notify   => Service[$prometheus_service],
  }
}
