# eGroupWare MySQL init template
#
# This files updates eGroupWare's domain name


USE mysql;

USE { $egroupware{DbName} };

REPLACE INTO `egw_config` (`config_app`, `config_name`, `config_value`)
 VALUES ('phpgwapi', 'hostname', '{$SystemName }.{ $DomainName }');

REPLACE INTO `egw_config` (`config_app`, `config_name`, `config_value`)
 VALUES ('phpgwapi', 'mail_suffix', '{ $DomainName }' );

REPLACE INTO `egw_emailadmin` (`ea_profile_id`, `ea_smtp_server`, `ea_smtp_type`, `ea_smtp_port`, `ea_smtp_auth`, `ea_editforwardingaddress`, `ea_smtp_ldap_server`, `ea_smtp_ldap_basedn`, `ea_smtp_ldap_admindn`, `ea_smtp_ldap_adminpw`, `ea_smtp_ldap_use_default`, `ea_imap_server`, `ea_imap_type`, `ea_imap_port`, `ea_imap_login_type`, `ea_imap_tsl_auth`, `ea_imap_tsl_encryption`, `ea_imap_enable_cyrus`, `ea_imap_admin_user`, `ea_imap_admin_pw`, `ea_imap_enable_sieve`, `ea_imap_sieve_server`, `ea_imap_sieve_port`, `ea_description`, `ea_default_domain`, `ea_organisation_name`, `ea_user_defined_accounts`,  `ea_order`, `ea_appname`, `ea_group`, `ea_smtp_auth_username`, `ea_smtp_auth_password`)
 VALUES (1, 'localhost', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'localhost', 2, 143, 'standard', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, 'default profile (created by setup)', '{ $DomainName }', NULL, NULL, NULL, '', '0', '', '');
