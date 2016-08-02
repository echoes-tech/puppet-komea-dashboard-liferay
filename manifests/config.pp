# Private class
class komea_dashboard_liferay::config (
  $komea_user             = $::komea_dashboard_liferay::komea_user,
  $komea_password         = $::komea_dashboard_liferay::komea_password,
  $exporter_port          = $::komea_dashboard_liferay::exporter_port,
  $cas_url                = $::komea_dashboard_liferay::cas_url,
  $dashboard_charts_url   = $::komea_dashboard_liferay::dashboard_charts_url,
  $dashboard_organization_url = $::komea_dashboard_liferay::dashboard_organization_url,
  $dashboard_exporter_url = $::komea_dashboard_liferay::dashboard_exporter_url,
  $base_location          = $::komea_dashboard_liferay::base_location,
  $logs_location          = $::komea_dashboard_liferay::logs_location,
  $spring_boot_admin_url  = $::komea_dashboard_liferay::spring_boot_admin_url,
  $jdbc_driver            = $::komea_dashboard_liferay::jdbc_driver,
  $jdbc_url               = $::komea_dashboard_liferay::jdbc_url,
  $jdbc_user              = $::komea_dashboard_liferay::jdbc_user,
  $jdbc_password          = $::komea_dashboard_liferay::jdbc_password,
  $web_server_host        = $::komea_dashboard_liferay::web_server_host,
  $web_server_protocol    = $::komea_dashboard_liferay::web_server_protocol,
  $web_server_http_port   = $::komea_dashboard_liferay::web_server_http_port
) inherits komea_dashboard_liferay {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  #------------ DASHBOARD EXPORTER ------------#

  $app_name = "dashboard-exporter"
  $app_path = "$base_location/$app_name/"
  $app_logs_location = "$logs_location/$app_name/"

  file { "${app_path}application.properties":
    ensure  => file,
    content => template("${module_name}/application.properties.erb"),
    notify  => Service['dashboard-exporter']
  }

  file { "$app_logs_location":
    ensure  => 'directory',
    mode    => '0755'
  }

  file { "${app_path}logback.xml":
    ensure  => file,
    content => template("${module_name}/logback.xml.erb"),
    notify => Service['dashboard-exporter']
  }

  #---------------- LIFERAY ----------------#

  $liferay_location = "$base_location/komea-liferay"

  file { "${liferay_location}/portal-ext.properties":
    ensure  => file,
    content => template("${module_name}/portal-ext.properties.erb"),
    notify  => Service['liferay']
  }

}
