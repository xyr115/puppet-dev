class profile::test_hiera(
  Boolean		$ssl,
  Boolean		$backups_enabled,
  Optional[String[1]]	$site_alias = undef,
) {
  file { '/tmp/test_hiera.txt':
    ensure  => file,
    content => @("END"),
	       Data from profile::test_hiera
	       -----
	       profile::test_hiera::ssl: ${ssl}
	       profile::test_hiera::backups_enabled: ${backups_enabled}
   	       profile::test_hiera::site_alias: ${site_alias}
	       |END
    owner => root,
    mode  => '0644',
  }
}
