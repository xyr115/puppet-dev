class alertmanager::service {
  service { '/etc/systemd/system/alertmanager.service':
    ensure => running,
    enable => true,
    require => Package['alertmanager'],
  }
}
