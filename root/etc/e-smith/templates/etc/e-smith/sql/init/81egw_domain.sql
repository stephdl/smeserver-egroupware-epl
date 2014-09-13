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

##added by stephdl to create the admin email contact

REPLACE INTO `egw_addressbook` (`contact_id`, `contact_tid`, `contact_owner`, `contact_private`, `cat_id`, `n_family`, `n_given`, `n_middle`, `n_prefix`, `n_suffix`, `n_fn`, `n_fileas`, `contact_bday`, `org_name`, `org_unit`, `contact_title`, `contact_role`, `contact_assistent`, `contact_room`, `adr_one_street`, `adr_one_street2`, `adr_one_locality`, `adr_one_region`, `adr_one_postalcode`, `adr_one_countryname`, `contact_label`, `adr_two_street`, `adr_two_street2`, `adr_two_locality`, `adr_two_region`, `adr_two_postalcode`, `adr_two_countryname`, `tel_work`, `tel_cell`, `tel_fax`, `tel_assistent`, `tel_car`, `tel_pager`, `tel_home`, `tel_fax_home`, `tel_cell_private`, `tel_other`, `tel_prefer`, `contact_email`, `contact_email_home`, `contact_url`, `contact_url_home`, `contact_freebusy_uri`, `contact_calendar_uri`, `contact_note`, `contact_tz`, `contact_geo`, `contact_pubkey`, `contact_created`, `contact_creator`, `contact_modified`, `contact_modifier`, `contact_jpegphoto`, `account_id`, `contact_etag`, `contact_uid`, `adr_one_countrycode`, `adr_two_countrycode`, `carddav_name`) VALUES
(2, 'n', 0, 0, NULL, 'Administrator (SME Server)', NULL, NULL, NULL, NULL, 'Administrator (SME Server)', 'SME Server Administrator: Administrator (SME Server)', NULL, 'SME Server Administrator', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@{$DomainName}', NULL, NULL, NULL, 'https://sme9dev64-4/egroupware/calendar/freebusy.php/?user=admin', NULL, NULL, '0', NULL, NULL, 1410022409, 0, 1410644937, 5, NULL, 5, 6, 'addressbook-2-c04cc44bbf0c0734f657d70a16656913', NULL, NULL, '2.vcf');

##creation of admin signature by stephdl
REPLACE INTO `egw_ea_identities` (`ident_id`, `acc_id`, `ident_realname`, `ident_email`, `ident_org`, `ident_signature`, `account_id`, `ident_name`) VALUES
(2, 1, 'Admin (Administrator of SME Server)', 'admin@{$DomainName}', '', '', 5, 'Admin');
