class komea_dashboard_liferay (
  $version                = $::komea_dashboard_liferay::params::version,
  $liferay_version        = $::komea_dashboard_liferay::params::liferay_version,
  $cas_url                = $::komea_dashboard_liferay::params::cas_url,
  $dashboard_charts_url   = $::komea_dashboard_liferay::params::dashboard_charts_url,
  $dashboard_organization_url = $::komea_dashboard_liferay::params::dashboard_organization_url,
  $dashboard_exporter_url = $::komea_dashboard_liferay::params::dashboard_exporter_url,
  $komea_user             = $::komea_dashboard_liferay::params::komea_user,
  $komea_password         = $::komea_dashboard_liferay::params::komea_password,
  $jdbc_driver            = $::komea_dashboard_liferay::params::jdbc_driver,
  $jdbc_url               = $::komea_dashboard_liferay::params::jdbc_url,
  $jdbc_user              = $::komea_dashboard_liferay::params::jdbc_user,
  $jdbc_password          = $::komea_dashboard_liferay::params::jdbc_password,
  $web_server_host        = $::komea_dashboard_liferay::params::web_server_host,
  $web_server_protocol    = $::komea_dashboard_liferay::params::web_server_protocol,
  $web_server_http_port   = $::komea_dashboard_liferay::params::web_server_http_port,
  $nexus_repository       = $::komea_dashboard_liferay::params::nexus_repository,
  $nexus_third_parties_repository = $::komea_dashboard_liferay::params::nexus_third_parties_repository,
  $nexus_url              = $::komea_dashboard_liferay::params::nexus_url,
  $nexus_user             = $::komea_dashboard_liferay::params::nexus_user,
  $nexus_password         = $::komea_dashboard_liferay::params::nexus_password,
  $nexus_liferay_group_id = $::komea_dashboard_liferay::params::nexus_liferay_group_id,
  $nexus_komea_group_id   = $::komea_dashboard_liferay::params::nexus_komea_group_id,
  $base_location          = $::komea_dashboard_liferay::params::base_location,
  $logs_location          = $::komea_dashboard_liferay::params::logs_location,
  $exporter_port          = $::komea_dashboard_liferay::params::exporter_port,
  $max_heap_size          = $::komea_dashboard_liferay::params::max_heap_size,
  $initial_heap_size      = $::komea_dashboard_liferay::params::initial_heap_size,
  $spring_boot_admin_url  = $::komea_dashboard_liferay::params::spring_boot_admin_url
) inherits komea_dashboard_liferay::params {

  anchor { "${module_name}::begin": } ->
  class { "${module_name}::install": } ->
  class { "${module_name}::config": } ~>
  class { "${module_name}::service": } ->
  anchor { "${module_name}::end": }

}
