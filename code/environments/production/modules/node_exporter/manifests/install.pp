class node_exporter::install {
  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease {
        '6': {
            package { 'node_exporter_init':
              ensure => installed,
            }
          }

        '7': {
            package { 'node_exporter':
              ensure => installed,
            }
          }
       }
     }
   }
 }
