class blackbox_exporter::service {
  $bb_listening_port = ':30115'
  file { '/etc/systemd/system/blackbox_exporter.service':
    notify  => Service['blackbox_exporter'],
    ensure  => present,
    mode    => 755,
    content => template('blackbox_exporter/blackbox_exporter.service.erb'),
  }

  service { 'blackbox_exporter':
    ensure     => running,
    hasrestart => true,
    hasstatus  => true,
    require  => Package['blackbox_exporter'],
  }
}
