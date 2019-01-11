class node_exporter(

) inherits node_exporter::params {
    contain 'node_exporter::install','node_exporter::service'
}
