class alertmanager::install {
  include hr_repo
  
  package { 'alertmanager':
    ensure   => installed,
    require  => Yumrepo['healthreveal'],
    provider => yum,
  }
}
