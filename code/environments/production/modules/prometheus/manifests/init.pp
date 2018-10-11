# Class: prometheus
class prometheus {
  contain 'prometheus::install','prometheus::config','prometheus::service'
}
