class prometheus(
  $listening_port = $prometheus::params::listening_port
) inherits prometheus::params {
  contain 'prometheus::install','prometheus::config','prometheus::service'
}
