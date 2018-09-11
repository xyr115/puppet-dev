#Class for configuring ntp
class ntp::config inherits ntp {
  $servers = $ntp::servers
  $config_file = $ntp::params::config_file
  $ntp_service = $ntp::ntp_service
  if ($facts['kernel'] == 'linux') {
    file { $config_file:
      ensure  => file,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => template('ntp/ntp.conf.erb'),
      notify  => Service[$ntp_service],
    }
  }
}
