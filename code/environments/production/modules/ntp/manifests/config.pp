#Class for configuring ntp
class ntp::config inherits ntp {
  $servers = ntp::servers
  file { '/etc/ntp.conf':
    ensure  => file,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('ntp/ntp.conf.erb'),
  }
}