#Prometheus config class
# Will update to templetize
class prometheus::config {
  file { '/etc/prometheus/prometheus.yaml':
      source => 'puppet:///modules/prometheus/prometheus.yaml',
      notify  => Service[prometheus],
  }
}
