class grafana::install {
  package { 'grafana':
    ensure => installed,
  }
}
