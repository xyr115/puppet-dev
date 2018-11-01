class node_exporter::service {
  case $::operatingsystemmajrelease {
   '7': {
      file { '/etc/systemd/system/node_exporter.service':
        notify => Service['node_exporter']
        ensure => file,
        source => 'puppet:///modules/node_exporter/node_exporter.service',
      }
      service { 'node_exporter':
        ensure => running,
        enable => true,
        require => Package['node_exporter'],
      }
    }
    default: {
      service { 'init_node_exporter':
        ensure => running,
        require => Package['init_node_exporter'],
      }

      file { '/etc/init.d/init_node_exporter':
        notify => Service['init_node_exporter'],
        ensure => file,
        mode   => 755,
        source => 'puppet:///modules/node_exporter/init_node_exporter.init',
      }
    }
  }
}
