file { '/etc/hosts':
  audit => ['content','owner'],
}

file { '/etc/passwd':
  audit => 'all',
}
