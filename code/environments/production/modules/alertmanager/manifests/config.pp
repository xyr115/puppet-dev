class alertmanager::config {
  file { '/etc/alertmanager/alertmanager.yml':
    notify  => Service['alertmanager'],
    ensure  => file,
    content => 'puppet:///modules/alertmanager/alertmanager.yml',
  }
}
