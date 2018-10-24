class grafana::config {
  file { '/etc/grafana/grafana.yml':
    notify => Service['grafana'],
    ensure => present,
    ensure => file,
  }
}
