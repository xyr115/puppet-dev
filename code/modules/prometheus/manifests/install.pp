#Class for installing Prometheus
class prometheus::install inherits prometheus {
    $prometheus_package = $prometheus::params::prometheus_package

    package { $prometheus_package:
        ensure => 'installed',
    }
}
