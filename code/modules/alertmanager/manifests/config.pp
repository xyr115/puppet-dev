class alertmanager::config {
  $alert_dirs = ['/var/lib/alertmanager/', '/var/lib/alertmanager/data/']

  file { $alert_dirs:
     ensure  => 'directory',
     owner   => 'alertmanager',
     group   => 'alertmanager',
     mode    => '755',
  }

  file { '/etc/alertmanager/alertmanager.yml':
    notify  => Service['alertmanager'],
    content  => template('alertmanager/alertmanager_configuration.erb'),
    require => Package['alertmanager'],
  }
}
