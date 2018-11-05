#This class installs the grafana package
class grafana::install {
  package { 'grafana':
    ensure   => installed,
    provider => yum,
  }
}
