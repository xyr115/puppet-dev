#Prometheus config class
# Will update to templetize
class prometheus::config {
   file { '/etc/prometheus/prometheus.yml':
        notify  => Service["prometheus"],
        ensure  => file,
        source  => "puppet:///modules/prometheus/prometheus.yml",
    }
}
