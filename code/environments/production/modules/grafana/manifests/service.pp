class grafana::service {
  service { 'grafana-server':
    ensure => running,
    require => Package['grafana'],
  }
}
