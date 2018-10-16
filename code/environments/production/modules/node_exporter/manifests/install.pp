class node_exporter::install {
  case $::operatingsystemmajrelease {
    '7': {
      package { 'node_exporter':
        ensure   => installed,
        provider => yum,
      }
    }
    default: {
      package { 'daemonize':
        ensure => installed,
      }
      package { 'init_node_exporter':
        require  => Package['daemonize'],
        provider => yum,
        ensure   => installed,
      }
    }
  }
}
