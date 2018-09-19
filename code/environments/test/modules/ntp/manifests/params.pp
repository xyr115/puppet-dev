#Class for parameters
class ntp::params {
  $servers = [
    '0.pool.ntp.org',
    '1.pool.ntp.org',
    '2.pool.ntp.org',
  ]
  if $facts['kernel'] == 'linux' {
    $config_file = '/etc/ntp.conf'
  }
  #Can add Windows Logic here if needed

  case $facts['osfamily'] {
    'RedHat', 'CentOS': { $ntp_service = 'ntpd' }
    default: { $ntp_service = 'ntp' }
  }
}
