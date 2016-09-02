# Private class
class komea_dashboard_liferay::install (
  $version                = $::komea_dashboard_liferay::version,
  $liferay_version        = $::komea_dashboard_liferay::liferay_version,
  $nexus_url              = $::komea_dashboard_liferay::nexus_url,
  $nexus_repository       = $::komea_dashboard_liferay::nexus_repository,
  $nexus_third_parties_repository = $::komea_dashboard_liferay::nexus_third_parties_repository,
  $nexus_user             = $::komea_dashboard_liferay::nexus_user,
  $nexus_password         = $::komea_dashboard_liferay::nexus_password,
  $base_location          = $::komea_dashboard_liferay::base_location,
  $max_heap_size          = $::komea_dashboard_liferay::max_heap_size,
  $initial_heap_size      = $::komea_dashboard_liferay::initial_heap_size,
  $jdbc_user              = $::komea_dashboard_liferay::jdbc_user,
  $jdbc_password          = $::komea_dashboard_liferay::jdbc_password
)inherits komea_dashboard_liferay {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  file { [ "$base_location" ]:
    ensure  => 'directory',
    mode    => '0755'
  }

  #------------ DASHBOARD-EXPORTER ------------#

  $app_name = "dashboard-exporter"
  $app_path = "$base_location/$app_name/"

  file { "$app_path":
    ensure  => 'directory',
    mode    => '0755'
  }

  file { "/etc/init.d/$app_name":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("${module_name}/application.sh.erb")
  }

  #----------------- LIFERAY -----------------#

  $liferay_location = "$base_location/komea-liferay"

  file { "$liferay_location":
    ensure => "directory",
    mode   => "0755"
  }

  file { "/etc/init.d/liferay":
    ensure   => "present",
    owner    => "root",
    group    => "root",
    mode     => "0755",
    content  => template("${module_name}/liferay.sh.erb")
  }

  $liferay_sqldump = "$base_location/liferay.sql"
  $liferay_dbname  = "liferay"

  file { "$liferay_sqldump":
    ensure  => "present",
    owner   => "root",
    group   => "root",
    mode    => "0755",
    content => template("${module_name}/liferay.sql.erb")
  }

  exec { "liferay-db-import":
    unless => "mysql --user=$jdbc_user --password=$jdbc_password -e 'use $liferay_dbname'",
    path => ["/bin", "/usr/bin"],
    command => "mysql --user=$jdbc_user --password=$jdbc_password < $liferay_sqldump",
    require => Service["mysqld"],
  }

  #------------ DEPLOY FROM NEXUS ------------#

  file { "${base_location}/nexus_deploy_liferay.sh":
    ensure  => "present",
    owner   => "root",
    group   => 'root',
    mode    => '0770',
    content => template("${module_name}/nexus_deploy_liferay.sh.erb")
  }

  exec { "deploy-liferay-nexus":
    path    => ['/usr/bin', '/usr/sbin', '/bin'],
    command => "${base_location}/nexus_deploy_liferay.sh ${nexus_user} ${nexus_password}",
    timeout => 0
  }

}
