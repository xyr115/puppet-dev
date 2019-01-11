class alertmanager::service {
  $box_addr = $::ipaddress
  file { '/etc/systemd/system/alertmanager.service':
    notify  => Service['alertmanager'],
    ensure  => file,
    content => template('alertmanager/alertmanager_service.erb'),
    require => Package['alertmanager'],
  }

  service { 'alertmanager':
    ensure  => running,
    require => Package['alertmanager']
  }
}
