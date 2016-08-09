
#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with Komea Dashboard](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with Komea Dashboard Liferay](#beginning-with-komea-dashboard-liferay)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
7. [Contributors](#contributors)

## Overview

Puppet module to manage Komea Dashboard's Liferay installation and configuration.

## Module Description

This module installs and configures [Komea Dashboard's Liferay Portal](https://echoes.fr/ksf/).

## Setup

### Setup Requirements

* **java** 1.7 or higher
* **MySQL** 5.5 or higher
* package **curl**
* package **zip/unzip**
* 
Supports Puppet v3 (optionally with future parser) and v4 with Ruby versions 1.8.7 (Puppet v3 only), 1.9.3, 2.0.0 and 2.1.0.

### Beginning with Komea Dashboard Liferay

```puppet
include ::komea_dashboard_core
```

## Reference

### Classes

#### Public classes

* komea_dashboard_core: Main class, includes all other classes.

#### Private classes

* komea_dashboard_core::params: Sets parameter defaults per operating system.
* komea_dashboard_core::install: Handles the packages.
* komea_dashboard_core::config: Handles the configuration file.
* komea_dashboard_core::service: Handles the services.

#### Parameters

The following parameters are available in the `::komea_dashboard_core` class:

##### `version`

Specifies the Komea Dashboard's version that will be installed. Valid options: string. Default value: 'sprint'.

##### `liferay_version`

Specifies the version of the Liferay packaging that will be installed. Valid options: string. Default value: '1.0.0'.

##### `cas_url`

Specifies the url of the CAS authentication service that will used to handle authentication in the Liferay Portal. Valid options: string. Default value: _undef_.

##### `dashboard_charts_url`

Specifies the url of Komea Dashboard's _Charts_ microservice _(accessible client-side)_. Valid options: string. Default value: _undef_.

##### `dashboard_organization_url`

Specifies the url of Komea Dashboard's _Organization_ microservice _(accessible client-side)_. Valid options: string. Default value: _undef_.

##### `dashboard_exporter_url`

Specifies the url of Komea Dashboard's _Exporter_ microservice _(accessible client-side)_. Valid options: string. Default value: _undef_.

##### `komea_user`

Specifies the username of a valid Komea Security's user that will be used to handle communication with Komea Dashboard's microservices. Valid options: string. Default value: _undef_.

##### `komea_password`

Specifies the password of the Komea Security's user that will be used to handle communication with Komea Dashboard's microservices. Valid options: string. Default value: _undef_.

##### `jdbc_driver`

Specifies the JDBC driver that will be used to connect Liferay to an external database. Valid options: string. Default value: 'com.mysql.jdbc.Driver'.

##### `jdbc_url`

Specifies the database url that will be used by Liferay. Valid options: string. Default value: 'jdbc:mysql://127.0.0.1:3306/liferay?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false&createDatabaseIfNotExist=true'.

##### `jdbc_user`

Specifies the username that will be used to connect Liferay to the database. Valid options: string. Default value: 'root'.

##### `jdbc_password`

Specifies the password of the JDBC user that will be used to connect Liferay to the database. Valid options: string. Default value: 'root'.

##### `web_server_protocol`

Specifies the protocol that will be used to access Liferay on the client-side _(HTTP/HTTPS)_. Valid options: string. Default value: 'http'.

##### `web_server_host`

Specifies the name of the host that will be used to access Liferay on the client-side. Valid options: string. Default value: 'localhost'.

##### `web_server_http_port`

Specifies the port that will be used to access Liferay on the client-side. Valid options: integer. Default value: 80.

##### `nexus_url`

Specifies the url of the Nexus server that will be used to retrieve Komea Dashboard's artifacts. Valid options: string. Default value: _undef_.

##### `nexus_repository`

Specifies the name of the Nexus repository that contains Komea Dashboard Core's artifacts. Valid options: string. Default value: 'komea'.

##### `nexus_third_parties_repository`

Specifies the name of the Nexus repository that contains Komea Dashboard's third parties components _(ex: Liferay Packaging)_. Valid options: string. Default value: 'komea-third-parties'.

##### `nexus_user`

Specifies the username of a valid Nexus user with the necessary privileges to download all required artifacts. Valid options: string. Default value: _undef_.

##### `nexus_password`

Specifies the password of the Nexus user that will be used to download the required artifacts. Valid options: string. Default value: _undef_.

##### `base_location`

Specifies the path of the directory where Komea Dashboard Liferay's components will be installed (the directory will be automatically created if it does not exist). Valid options: string. Default value: '/opt/echoes/liferay'.

##### `logs_location`

Specifies the path of the directory that will contains all output logs of each Komea Dashboard's microservice. Valid options: string. Default value: '/var/log'.

##### `exporter_port`

Specifies the running port of the Komea Dashboard Exporter instance that will be initialized. Valid options: integer. Default value: 8096.

##### `spring_boot_admin_url`

Specifies the url of the Spring Boot Admin service that will reference the Komea Dashboard Exporter instance. Valid options: string. Default value: 'http://localhost:8089'.

##### `max_heap_size`

Specifies the maximum heap size that can be allocated to the Komea Dashboard Exporter instance. Valid options: string. Default value: '64m'.

##### `initial_heap_size`

Specifies the initial heap size that will be allocated to the Komea Dashboard Exporter instance. Valid options: string. Default value: '32m'.

## Limitations

Debian family OSes are officially supported. Tested and built on Debian.

##Development

[Echoes Technologies](https://www.echoes-tech.com) modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great.

## Contributors

The list of contributors can be found at: https://github.com/echoes-tech/puppet-komea-dashboard-liferay/graphs/contributors
