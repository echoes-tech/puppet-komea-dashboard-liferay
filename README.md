# puppet-komea-dashboard-liferay

Manage Komea Dashboard's Liferay installation and configuration from Puppet.

## Requirements

* **java** 1.7 or higher
* **MySQL** 5.5 or higher
* package **curl**
* package **zip/unzip**

## Parameters

| Parameter              | Value type | Default value | Description | 
|:----------------------:|:----------:|:-------------:|-------------|
| version                | _String_ | _sprint_ | Komea Dashboard's version                                     | 
| liferay_version        | _String_ | _1.0.0_  | The version of the Liferay packaging that will be installed   | 
| cas_url                | _String_ | _undef_  | The url of the CAS authentication service                     |
| dashboard_charts_url   | _String_ | _undef_  | The url of Komea Dashboard's _Charts_ microservice _(accessible client-side)_ |
| dashboard_organization_url | _String_ | _undef_ | The url of Komea Dashboard's _Organization_ microservice _(accessible client-side)_ |
| dashboard_exporter_url | _String_ | _undef_  | The url of Komea Dashboard's _Exporter_ microservice _(accessible client-side)_ |
| komea_user             | _String_ | _undef_  | The username of a valid Komea Security's user that will be used to handle communication with Komea Dashboard's microservices |
| komea_password         | _String_ | _undef_  | The password of the Komea Security's user that will be used to handle communication with Komea Dashboard's microservices |
| jdbc_driver            | _String_ | _com.mysql.jdbc.Driver_ | The JDBC driver that will be used to connect Liferay to an external database |
| jdbc_url               | _String_ | _jdbc:mysql://127.0.0.1:3306/liferay?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false&createDatabaseIfNotExist=true_ | The database url |
| jdbc_user              | _String_ | _root_   | The username that will be used to connect Liferay to the database |
| jdbc_password          | _String_ | _root_   | The password of the JDBC user that will be used to connect Liferay to the database |
| web_server_protocol    | _String_ | _http_   | The protocol that will be used to access Liferay on the client-side _(HTTP/HTTPS)_ |
| web_server_host        | _String_ | _localhost_ | The name of the host that will be used to access Liferay on the client-side     |
| web_server_http_port   | _Integer_ | _80_    | The port that will be used to access Liferay on the client-side                    |
| nexus_url              | _String_ | _undef_  | The url of the Nexus server that will be used to retrieve Komea Dashboard's artifacts |
| nexus_repository       | _String_ | _komea_  | The name of the Nexus repository that contains Komea Dashboard Core's artifacts       |
| nexus_third_parties_repository | _String_ | _komea-third-parties_ | The name of the Nexus repository that contains Komea Dashboard's third parties components _(Apache ActiveMQ, etc)_ |
| nexus_user             | _String_ | _undef_  | The username of a valid Nexus user with the necessary privileges to download all required artifacts |
| nexus_password         | _String_ | _undef_  | The password of the Nexus user that will be used to download the required artifacts |
| base_location          | _String_ | _/opt/echoes/liferay_ | The path of the directory where Liferay components will be installed (the directory will be automatically created if it does not exist) |
| logs_location           | _String_ | _/var/log_ | The path of the directory that will contains all output logs of each Komea Dashboard's microservice |
| exporter_port          | _Integer_ | _8096_ | The running port of the Komea Dashboard Exporter instance that will be initialized | 
| spring_boot_admin_url  | _String_  | _http://localhost:8089_ | The url of the Spring Boot Admin service that will reference the Komea Dashboard Exporter instance |
| max_heap_size          | _String_  | _64m_  | The maximum heap size that can be allocated to the Komea Dashboard Exporter instance |
| initial_heap_size      | _String_  | _32m_  | The initial heap size that will be allocated to the Komea Dashboard Exporter instance |
