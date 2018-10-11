#Class for prometheus module
class prometheus::install {
  case $::kernel {
    'Linux': {
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
