class grafana::service {
  file { '/etc/systemd/system/grafana.service':
    require => Package['grafana'],
    ensure  => present,
  }

  service { 'grafana':
    ensure => running,
    require => Package['grafana'],
  }
}
