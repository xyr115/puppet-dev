#Class for ntp service
class ntp::service inherits ntp {
  $ntp_service = $ntp::ntp_service
  service { $ntp_service:
    ensure  => running,
    enable  => true,
    require => Package['ntp'],
  }
}
