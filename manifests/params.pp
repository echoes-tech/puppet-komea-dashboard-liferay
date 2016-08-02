# == Class: Komea Foundation::params
#
# This is a container class with default parameters for Komea Foundation classes.
class komea_dashboard_liferay::params {

  $version                = "sprint"
  $liferay_version        = "1.0.0"

  $cas_url                = undef
  $dashboard_charts_url   = undef
  $dashboard_organization_url = undef
  $dashboard_exporter_url = undef

  $komea_user             = undef
  $komea_password         = undef

  $jdbc_driver            = "com.mysql.jdbc.Driver"
  $jdbc_url               = "jdbc:mysql://127.0.0.1:3306/liferay?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false&createDatabaseIfNotExist=true"
  $jdbc_user              = "root"
  $jdbc_password          = "root"

  $web_server_protocol    = "http"
  $web_server_host        = "localhost"
  $web_server_http_port   = "80"

  $nexus_url              = undef
  $nexus_repository       = "komea"
  $nexus_third_parties_repository = "komea-third-parties"
  $nexus_user             = undef
  $nexus_password         = undef

  $base_location          = "/opt/echoes/liferay"
  $logs_location          = "/var/log"

  $exporter_port          = 8096
  $spring_boot_admin_url  = "http://localhost:8089"
  $max_heap_size          = "64m"
  $initial_heap_size      = "32m"

}
