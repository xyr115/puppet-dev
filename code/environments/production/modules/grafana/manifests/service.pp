#This class starts the grafana service
class grafana::service {
  service { 'grafana-server':
    ensure => running,
    require => Package['grafana'],
  }
}
