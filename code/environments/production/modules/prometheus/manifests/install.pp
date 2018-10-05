#Class for prometheus module
class prometheus::install {
  $os_family = $facts['os_family']
  case $facts['kernel'] {
    'linux': {
      package { 'prometheus':
        ensure   => 'installed',
        provider => 'yum',
      }
    }
    default: {
      fail('ERROR: unsupported by this prometheus module!')
    }
  }
}
