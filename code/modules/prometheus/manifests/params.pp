class prometheus::params {
  $service_listening_port       = '30090'
  $config_file                  = '/etc/prometheus/prometheus.yml'
  $prometheus_service           = 'prometheus'
  $host_addr                    = $::ipaddress
  $alert_rules                  = '/etc/prometheus/alert_rules.yml'
  $systemd_unit                 = '/etc/systemd/system/prometheus.service'
  $prometheus_package           = 'prometheus'
}
