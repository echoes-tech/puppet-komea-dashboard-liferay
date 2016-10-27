# Private class
class komea_dashboard_liferay::service inherits komea_dashboard_liferay {

  if $caller_module_name != $module_name {
      fail("Use of private class ${name} by ${caller_module_name}")
  }

  service { 'dashboard-exporter':
    ensure  => running,
    start   => "/etc/init.d/dashboard-exporter start",
    stop    => "/etc/init.d/dashboard-exporter stop",
    status  => "/etc/init.d/dashboard-exporter status",
  }

  #----------------- APPLICATION TV -------------------#

  service { 'application-tv':
    ensure => running,
    start   => "/etc/init.d/application-tv start",
    stop    => "/etc/init.d/application-tv stop",
    status  => "/etc/init.d/application-tv status",
  }

  service { 'liferay':
    ensure  => running,
    start   => "/etc/init.d/liferay start",
    stop    => "/etc/init.d/liferay stop",
    status  => "/etc/init.d/liferay status",
  }

}
