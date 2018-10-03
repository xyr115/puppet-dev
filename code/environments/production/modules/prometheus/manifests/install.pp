#Class for prometheus module
class prometheus::install {
  $os_family = $facts['os_family']
  case $facts['kernel'] {
    'linux': {
      file {'/tmp/prometheus-2.3.2-1.el7.x86_64.rpm':
        source =>  'puppet:///modules/prometheus/prometheus-2.3.2-1.el7.x86_64.rpm',
      }

      package { 'prometheus-2.3.2-1.el7.x86_64.rpm':
        ensure   => 'present',
        provider => 'rpm',
        source   =>  '/tmp/prometheus-2.3.2-1.el7.x86_64.rpm',
        require => File["/tmp/prometheus-2.3.2-1.el7.x86_64.rpm"],
      }
    }
    default: {
      fail('ERROR: unsupported by this prometheus module!')
    }
  }
}
