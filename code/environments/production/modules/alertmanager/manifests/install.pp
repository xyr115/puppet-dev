class alertmanager::install {
  case $::kernel {
    'Linux': {
      package { 'alertmanager':
        ensure   => 'installed',
        provider => 'yum',
      }
    }
    default: {
      fail('ERROR: unsupported by this alertmanager module!')
    }
  }
}
