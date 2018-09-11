# Class to install ntp package
class ntp::install {
  $os_family = $facts['os_family']
  case $facts['kernel'] {
    'linux': {
      package { 'ntp':
        ensure => installed,
      }
    }
    default: {
      fail('ERROR: unsupported by this ntp module!')
    }
  }
}
