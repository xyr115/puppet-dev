class blackbox_exporter::install {
  package { 'blackbox_exporter':
    ensure => installed,
    provider => yum,
  }
}
