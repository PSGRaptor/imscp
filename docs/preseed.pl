#!/usr/bin/perl

# i-MSCP preseed.pl template file for installer preseeding feature
#
# See documentation at http://wiki.i-mscp.net/doku.php?id=start:preseeding
#
# Author: Laurent Declercq <l.declercq@nuxwin.com>
# Last update: 2018.09.12

{
    #
    ## System configuration
    #

    # Server hostname
    # Possible values: A fully qualified hostname name
    SERVER_HOSTNAME                     => '',

    # Server primary IP
    # Possible values: An already configured IPv4, IPv6 or 'None'
    # The 'None' option is more suitable for Cloud computing services such as
    # Scaleway and Amazon EC2. Selecting the 'None' option means that i-MSCP
    # will configures the services to listen on all interfaces.
    BASE_SERVER_IP                      => '',

    # WAN IP (only relevant if your primary IP is in private range)
    # You can force usage of a private IP by putting BASE_SERVER_IP IP value
    # instead of a public IP. You can also leave this parameter empty for
    # automatic detection of your public IP using ipinfo.io Web service.
    # Possible values: Ipv4 or IPv6
    BASE_SERVER_PUBLIC_IP               => '',

    # IPv6 support
    #
    # Possible values: yes, no
    #
    # Bear in mind that if IPv6 support is disabled on your system, setting
    # this parameter to 'yes' will not change anything.
    IPV6_SUPPORT                        => 'yes',

    # Timezone
    # Possible values: A valid timezone such as Europe/Paris
    # (see http://php.net/manual/en/timezones.php)
    # Leave this parameter empty for automatic timezone detection.
    TIMEZONE                            => '',

    #
    ## Backup configuration parameters
    #

    # i-MSCP backup feature (database and configuration files)
    # Enable backup for i-MSCP
    # Possible values: yes, no
    BACKUP_IMSCP                        => 'yes',

    # Enable backup feature for customers
    # Possible values: yes, no
    BACKUP_DOMAINS                      => 'yes',

    #
    ## SQL server configuration parameters
    #

    # SQL server vendor/version
    # Please consult the ../autoinstaller/Packages/<distro>-<codename>.xml file
    # for available options, leave empty for default SQL vendor/version.
    SQLD_SERVER                         => '',

    # Database name
    DATABASE_NAME                       => 'imscp',

    #
    ## SQL server configuration
    #

    # Databas hostname
    # Possible values: A valid hostname or IP address
    DATABASE_HOST                       => 'localhost',

    # Database port
    # Note that this port is used only for connections through TCP.
    # Possible values: A valid port
    DATABASE_PORT                       => '3306',

    # SQL root user (mandatory)
    # This SQL user must have full privileges on the SQL server.
    # Note that this user used only while i-MSCP installation/reconfiguration.
    SQL_ROOT_USER                       => 'root',
    # Not required when the (system) SQL root user can connect without password
    # (like in recent Debian versions (case of unix_socket plugin usage).
    # In such case you should leave the password empty.
    SQL_ROOT_PASSWORD                   => '',

    # i-MSCP Master SQL user
    # That is the primary SQL user for i-MSCP. It is used to connect to database
    # and create/delete SQL users for your customers.
    # Note that the debian-sys-maint, imscp_srv_user, mysql.user, root and
    # vlogger_user SQL users are not allowed.
    DATABASE_USER                       => 'imscp_user',
    # Only ASCII alphabet characters and numbers are allowed in password.
    # Leave this parameter empty for automatic password generation.
    DATABASE_PASSWORD                   => '',

    # Database user host (only relevant for remote SQL server)
    # That is the host from which SQL users created by i-MSCP are allowed to
    # connect to the SQL server.
    # Possible values: A valid hostname or IP address
    DATABASE_USER_HOST                  => '',

    # Enable or disable prefix/suffix for customer SQL database names
    # Possible values: behind, infront, none
    MYSQL_PREFIX                        => 'none',

    #
    ## Control panel configuration parameters
    #

    # Control panel hostname
    # This is the hostname from which the control panel will be reachable
    # Possible values: A fully qualified hostname name
    BASE_SERVER_VHOST                   => '',

    # Control panel http port
    # Possible values: A port in range 1025-65535
    BASE_SERVER_VHOST_HTTP_PORT         => '8880',

    # Control panel https port (only relevant if SSL is enabled for the control
    # panel (see below))
    # Possible values: A port in range 1025-65535
    BASE_SERVER_VHOST_HTTPS_PORT        => '8443',

    # PHP version for the control panel
    # Possible value: php5.6, php7.0, php7.1
    PANEL_PHP_VERSION                   => 'php7.1',

    # Web server for the control panel
    # Possible value: nginx
    PANEL_HTTPD_SERVER                  => 'nginx',

    # Enable or disable SSL
    # Possible values: yes, no
    PANEL_SSL_ENABLED                   => 'yes',

    # Whether or not a self-signed SSL cettificate must be used
    # Possible values: yes, no
    PANEL_SSL_SELFSIGNED_CERTIFICATE    => 'yes',

    # SSL private key path (only relevant for trusted SSL certificate)
    PANEL_SSL_PRIVATE_KEY_PATH          => '',

    # SSL private key passphrase (only if the private key is encrypted)
    PANEL_SSL_PRIVATE_KEY_PASSPHRASE    => '',

    # SSL CA Bundle path(only relevant for trusted SSL certificate)
    PANEL_SSL_CA_BUNDLE_PATH            => '',

    # SSL certificate path (only relevant for trusted SSL certificate)
    PANEL_SSL_CERTIFICATE_PATH          => '',

    # Alternative URLs feature for client websites
    # Possible values: yes, no
    WEBSITE_ALT_URLS                    => 'no',

    # Control panel default access mode (only relevant if SSL is enabled)
    # Possible values: http://, https://
    BASE_SERVER_VHOST_PREFIX            => 'http://',

    # Master administrator login
    ADMIN_LOGIN_NAME                    => 'admin',
    # Only ASCII alphabet characters and numbers are allowed in password.
    ADMIN_PASSWORD                      => '',

    # Master administrator email address
    # Possible value: A valid email address. Mails sent to local root user will
    # be forwarded to that address.
    DEFAULT_ADMIN_ADDRESS               => '',

    ## DNS server configuration

    # DNS server implementation
    # Possible values: bind, external_server
    NAMED_SERVER                        => 'bind',

    # DNS server type to configure (only relevant with the 'bind' server)
    # Possible values: master, slave
    BIND_TYPE                           => 'master',

    # Type of DNS server to configure (only relevant with the 'bind' server)
    #
    # Possible values: master, slave
    BIND_IPV6                           => 'yes',

    # IP addresses policy for the DNS server (only relevant with the 'bind' server)
    #
    # Master DNS server (BIND_TYPE = master)
    #
    # Whether routable IP addresses must be enforced in DNS zone files.
    #
    # When set to yes the server public IP will be used in place of the
    # client domain IP addresses (A/AAAA records) when those are non-routable.
    #
    # Possible values: yes, no
    #
    # Slave DNS server (BIND_TYPE = slave)
    #
    # This parameter is not relevant in the context of a Slave DNS server.
    #
    # Possible values: empty value.
    BIND_ENFORCE_ROUTABLE_IPS           => 'yes',

    # IP addresses for the master/authoritative DNS server (only relevant with the 'bind' server)
    #
    # Master DNS server (BIND_TYPE = master)
    #
    # Possible values: 'none' for historical behavior, or a list of space, comma or
    # semicolon separated IP addresses for the master DNS server (NS, glue recors).
    #
    # In historical behavior, the IP addresses are set on a per zone basis using
    # client IP addresses.
    #
    # Slave DNS server (BIND_TYPE = slave)
    #
    # Possible values: A list of space, comma or semicolon separated IP addresses
    # for the authoritative DND servers (masters statement in the DNS zone files).
    #
    # IPv6 addresses are only allowed if the BIND_IPV6 value is set to 'yes'.
    BIND_MASTER_IP_ADDRESSES            => 'none',

    # DNS names for the DNS server (only relevant with the 'bind' server)
    #
    # Master DNS server (BIND_TYPE = master)
    #
    # Possible value: 'none' for historical behavior, or a list of space, comma
    # or semicolon separated master DNS server names (NS, glue recors), one for
    # each master DNS server IP address and following the same order.
    #
    # In historical behavior, names are generated on a per zone basis, using client
    # domain names.
    #
    # Slave DNS server (BIND_TYPE = slave)
    #
    # This parameter is not relevant in the context of a slave DNS server.
    #
    # Possible values: empty value.
    BIND_MASTER_NAMES                   => 'none',

    # Hostmaster email address for the DNS server (only relevant with the 'bind' server)
    #
    # Master DNS server (BIND_TYPE = master)
    #
    # Possible value: 'none' for historical behavior or a valid email address for
    # the person responsible of the DNS zone management (SOA hostmaster). 
    #
    # In historical behavior, the hostmaster email address is configured on a per
    # zone basis, using client domain names.
    #
    # This parameter is only relevant when the BIND_MASTER_IP_ADDRESSES parameter
    # is set to a value other than 'none'.
    #
    # Slave DNS server (BIND_TYPE = slave)
    #
    # This parameter is not relevant in the context of a slave DNS server.
    #
    # Possible values: empty value.
    BIND_HOSTMASTER_EMAIL               => 'none',

    # IP addresses for the slave DNS server (only relevant with the 'bind' server)
    #
    # Master DNS server (BIND_TYPE = master)
    #
    # Possible values: 'none' for no slave DNS servers, or a list of space, comma
    # or semicolon separated IP addresses for the slave DNS servers.
    #
    # IPv6 addresses are only allowed if the BIND_IPV6 parameter value is set to
    # 'yes'.
    #
    # Slave DNS server (BIND_TYPE = slave)
    #
    # This parameter is not relevant in the context of a slave DNS server.
    #
    # Possible values: empty value.
    BIND_SLAVE_IP_ADDRESSES             => '',

    # Names for the slave DNS servers (only relevant with the 'bind' server)
    #
    # Master DNS server (BIND_TYPE = master)
    #
    # Possible value: 'none' for historical behavior, or a list of space, comma
    # or semicolon separated master DNS server names (NS, glue recors), one for
    # each slave DNS server IP address and following the same order.
    #
    # In historical behavior, names are generated on a per zone basis,
    # using client domain names.
    #
    # This parameter is only relevant when the BIND_SLAVE_IP_ADDRESSES parameter
    # is set to a value other than 'none'.
    #
    # Slave DNS server (BIND_TYPE = slave)
    #
    # This parameter is not relevant in the context of a slave DNS server.
    #
    # Possible values: empty value.
    BIND_SLAVE_NAMES                    => '',

    # Local DNS resolver (only relevant with 'bind' server implementation)
    # Possible values: yes, no
    LOCAL_DNS_RESOLVER                  => 'yes',

    ## HTTTPd server configuration parameters

    # HTTPd server implementation
    # Possible values: apache_itk, apache_fcgid, apache_php_fpm
    HTTPD_SERVER                        => 'apache_php_fpm',

    ## PHP configuration parameters

    # PHP version for customers
    # Popssible values: php5.6, php7.0, php7.1, php7.2
    PHP_SERVER                          => 'php5.6',

    # PHP configuration level
    # Possible values: per_user, per_domain, per_site
    PHP_CONFIG_LEVEL                    => 'per_site',

    # PHP-FPM listen socket type
    # Only relevant with 'apache_php_fpm' sever implementation
    # Possible values: uds, tcp
    PHP_FPM_LISTEN_MODE                 => 'uds',

    ## FTP server configuration parameters

    # FTPd server implementation
    # Possible values: proftpd, vsftpd
    FTPD_SERVER                         => 'proftpd',

    # FTP SQL user
    # Only ASCII alphabet characters and numbers are allowed in password.
    FTPD_SQL_USER                       => 'imscp_srv_user',
    # Only ASCII alphabet characters and numbers are allowed in password.
    # Leave this parameter empty for automatic password generation.
    FTPD_SQL_PASSWORD                   => '',

    # Passive port range
    # Possible values: A valid port range in range 32768-60999
    # Don't forgot to forward TCP traffic on those ports on your server if you're behind a firewall
    FTPD_PASSIVE_PORT_RANGE             => '32800 33800',

    ## MTA server configuration parameters

    # MTA server implementation
    # Possible values: postfix
    MTA_SERVER                          => 'postfix',

    ## IMAP, POP server configuration parameters

    # POP/IMAP servers implementation
    # Possible values: courier, dovecot
    PO_SERVER                           => 'dovecot',

    # Authdaemon SQL user
    # Only ASCII alphabet characters and numbers are allowed in password.
    AUTHDAEMON_SQL_USER                 => 'imscp_srv_user',
    # Only ASCII alphabet characters and numbers are allowed in password.
    # Leave this parameter empty for automatic password generation.
    AUTHDAEMON_SQL_PASSWORD             => '',

    # Dovecot SQL user
    # Only relevant with 'dovecot' server implementation
    # Only ASCII alphabet characters and numbers are allowed in password.
    DOVECOT_SQL_USER                    => 'imscp_srv_user',
    # Only ASCII alphabet characters and numbers are allowed in password.
    # Leave this parameter empty for automatic password generation.
    DOVECOT_SQL_PASSWORD                => '',

    ## SSL configuration for FTP, IMAP/POP and SMTP services

    # Enable or disable SSL
    # Possible values: yes, no
    SERVICES_SSL_ENABLED                => 'yes',

    # Whether or not a self-signed SSL certificate must be used
    # Only relevant if SSL is enabled
    # Possible values: yes, no
    SERVICES_SSL_SELFSIGNED_CERTIFICATE => 'yes',

    # SSL private key path (only relevant for trusted SSL certificate)
    # Possible values: Path to SSL private key
    SERVICES_SSL_PRIVATE_KEY_PATH       => '',

    # SSL private key passphrase (only if the private key is encrypted)
    # Possible values: SSL private key passphrase
    SERVICES_SSL_PRIVATE_KEY_PASSPHRASE => '',

    # SSL CA Bundle path (only relevant for trusted SSL certificate)
    # Possible values: Path to the SSL CA Bundle
    SERVICES_SSL_CA_BUNDLE_PATH         => '',

    # SSL certificate path (only relevant for trusted SSL certificate)
    # Possible values: Path to SSL certificate
    SERVICES_SSL_CERTIFICATE_PATH       => '',

    ## i-MSCP packages (addons)

    # Anti-rootkits packages
    # Possible values: 'none' for no packages, or a comma separated list of
    #                   packages
    # Available packages are: Chkrootkit, Rkhunter
    ANTIROOTKIT_PACKAGES                => 'none',

    # FTP Web file manager packages
    # Possible values: 'none' for no packages, or a comma separated list of
    #                   packages
    # Available packages: MonstaFTP, Pydio (only if the PHP version for the control panel is < 7.0)
    FILEMANAGER_PACKAGES                => 'none',

    # Postfix addon packages (only relevant with the Postfix MTA server)
    # Possible values: 'none' for no packages, or a comma separated list of
    #                   packages
    #
    # Available packages are:
    #  - ClamAV       : SMTP antivirus
    #  - PolicydWeight: policy-weight daemon
    #  - Postgrey     : Policy server to implement "greylisting".
    #  - Postscreen   : Postfix postscreen server that provides additional protection against mail server overload
    #  - Rspamd       : Advanced spam filtering system
    #  - SPF          : Postfix policy server for RFC 4408 SPF checking
    #  - SRS          : Sender Rewriting Scheme (SRS) support for Postfix via TCP-based lookup tables
    #
    # If you select the Rspamd package, you shouldn't make use of any of the following packages:
    #  - PolicydWeight: Instead, you should use the RBL Rspamd module
    #  - Postgrey     : Instead, you should use the Greylisting Rspamd module
    #  - SPF          : Instead, you should use the SPF Rspamd module
    POSTFIXADDON_PACKAGES               => 'none',

    # Webmmail packages
    # Possible values: 'none' for no packages, or a comma separated list of
    #                   packages
    # Available packages: PhpMyAdmin
    SQLMANAGER_PACKAGES                 => 'none',

    # Webmmail packages
    # Possible values: 'none' for no packages, or a comma separated list of
    #                   packages
    # Available packages: RainLoop, Roundcube
    WEBMAIL_PACKAGES                    => 'none',

    # Webstats packages
    # Possible values: 'none' for no packages, or a comma separated list of
    #                   packages
    # Available packages: AWStats
    WEBSTATS_PACKAGES                   => 'none',

    ## PhpMyAdmin SQL manager
    ## Only relevant with the PhpMyAdmin package

    # SQL user for PhpMyAdmin
    PHPMYADMIN_SQL_USER                 => 'imscp_srv_user',
    # Only ASCII alphabet characters and numbers are allowed in password.
    # Leave this parameter empty for automatic password generation.
    PHPMYADMIN_SQL_PASSWORD             => '',

    ## Roundcube webmail
    ## Only relevant with the Roundcube package

    # SQL user for Roundcube package (only if you use Roundcube)
    ROUNDCUBE_SQL_USER                  => 'imscp_srv_user',
    # Only ASCII alphabet characters and numbers are allowed in password.
    # Leave this parameter empty for automatic password generation.
    ROUNDCUBE_SQL_PASSWORD              => '',

    ## Rainloop webmail
    ## Only relevant with the Rainloop package

    # SQL user for Rainloop
    RAINLOOP_SQL_USER                   => 'imscp_srv_user',
    # Only ASCII alphabet characters and numbers are allowed in password.
    # Leave this parameter empty for automatic password generation.
    RAINLOOP_SQL_PASSWORD               => '',

    ## Rspamd spam filtering system configuration parameters
    ## Only relevant with the Rspamd package (Postfix addon)

    # Rspamd modules
    # Possible values: 'none' for no packages, or a comma separated list of
    #                   packages
    #
    # Available modules are: ASN, DKIM, DKIM Signing, DMARC, Emails,
    #                        Greylisting, Milter Headers, Mime Types,
    #                        MX Check, RBL, Redis History, SPF, Surbl
    #
    # There is also the ANTIVIRUS module which is managed internally and
    # enabled only if you choose ClamAV as antivirus solution.
    RSPAMD_MODULES                      => 'ASN,DKIM,DKIM Signing DMARC,Emails,Greylisting,Milter Headers,Mime Types,MX check,RBL,Redis History,SPF,Surbl',
    # Rspamd Web interface
    # Whether or not to enable the Rspamd Web interface
    # Possible values: yes, no
    RSPAMD_WEBUI                        => 'no',
    # Only ASCII alphabet characters and numbers are allowed in password.
    RSPAMD_WEBUI_PASSWORD               => ''
};

1;
