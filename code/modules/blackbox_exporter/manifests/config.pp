class blackbox_exporter::config {
  file { '/etc/blackbox_exporter/blackbox.yml':
    notify => Service['blackbox_exporter'],
    ensure => present,
    content => template('blackbox_exporter/blackbox.yml.erb'),
  }
}
