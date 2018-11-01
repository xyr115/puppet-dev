class grafana::service {
  service { 'grafana':
    ensure => running,
    require => Package['grafana'],
  }
}
