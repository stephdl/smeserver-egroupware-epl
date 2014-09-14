# $Id: smeserver-egroupware.spec,v 1.7 2013/12/15 19:24:32 unnilennium Exp $
# Authority: cool34000
# Name: Sylvain Gomez

%define name smeserver-egroupware-epl
%define version 14.1
%define release 1


Summary:            egroupware-epl web application for SME >=9
Name:               %{name}
Version:            %{version}
Release:            %{release}%{?dist}
License:            GPL
Group:              Web/Application
Source:             %{name}-%{version}.tar.gz
URL:                http://www.egroupware.org
BuildRoot:          /var/tmp/%{name}-%{version}-%{release}-buildroot
BuildArchitectures: noarch
BuildRequires:      e-smith-devtools
Requires:           e-smith-base, e-smith-release >= 9
Requires:           egroupware-epl
Requires:          php-pecl-zendopcache
Obsoletes:          smeserver-egroupware

%description
This RPM is an unofficial addon for the SME Server 8.x and above.
egroupware-epl is a free enterprise ready groupware software for your network.
It enables you to manage contacts, appointments, todos and many more for your whole business.
eGroupWare is a groupware server. It comes with a native web-interface which allowes to access
your data from any platform all over the planet. Moreover you also have the choice to access the
eGroupWare server with your favorite groupware client (Kontact, Evolution, Outlook) and also with
your mobile or PDA via SyncML.
eGroupWare is international. At the time, it supports more than 25 languages including rtl support.
eGroupWare is platform independent. The server runs on Linux, Mac, Windows and many more other
operating systems. On the client side, all you need is a internetbrowser such as Firefox,
Konqueror, Internet Explorer and many more.
https://yourdomain.com/egroupware


%changelog
* Mon Sep 01 2014 stephane de Labrusse <stephdl@de-labrusse.fr> 14-1.sme
- Initial release to sme9 in stephdlrepo

* Sun Dec 15 2013  JP Pialasse <tests@pialasse.com> 1.8.005-5.sme
- fix hostname [SME: 5127]

* Fri Dec 13 2013 JP Pialasse <tests@pialasse.com> 1.8.005-4.sme
- fixed deletion script see [SME: 8040] comment 25 

* Thu Dec 12 2013 JP Pialasse <tests@pialasse.com> 1.8.005-3.sme
- upgrade to eGroupware 1.8 using opensuse rpm for Centos5
- built for eGroupware-1.8.005.20131007
- see [SME: 8040]
- 2 revert back some configuration in spec
- will need to move to an event 
- 3 fix tmp and sess directory 
- fix default g2data path

* Tue Jun 04 2013 JP Pialasse <tests@pialasse.com> 1.4.004-2.sme
- fix upload dir not defined [SME 7653]
- updated e-smith-release >8

* Mon May 12 2008 Sylvain Gomez <sylvaingomez@free.fr>
- [1.4.004-1] Update to new version 1.4.004
            Update eGroupWare and Gallery to latest available versions
            - Apache template modified for FCKeditor (thanks to 'atariblau')
            - Default database updated

* Fri Oct 26 2007 Sylvain Gomez <sylvaingomez@free.fr>
- [1.4.002-3] Improving SME integration
            MySQL init templates added
            - Events added for DomainName changes
            - MySQL importation method changed
            - Security is now improved on header.inc.php after an update
            - Gallery2 added (but not installed by default)
            - Type changed from service to url
            - Fudforum obsolete lines commented in Apache template

* Sun Oct 21 2007 Sylvain Gomez <sylvaingomez@free.fr>
- [1.4.002-2] Improving upgradability&MySQL DataBase
             MySQL DataBase rebuilt in utf-8 (new installations only!)
             - Fixed Spanish lang in login page (new installations only!)
             - Fixed MySQL rights after when updating from older version
             - Fixed files not upgrading from v1.4.001 to v1.4.002
             - Security is now reset when updating
             - phpSysInfo security improved in Apache template
             - Generating shorter passwords (new installations only!)
             - Description text updated
             - More comments at the install stage

* Sat Oct 20 2007 Sylvain Gomez <sylvaingomez@free.fr>
- [1.4.002-1] Improving upgradability&RPM structure
             BETA VERSION
             - RPM renamed to smeserver-egroupware-1.4.002
             - Fixed RPM structure
             - Fixed iCal bug installing old version 1.4.001
             - Improved Sitemgr (create link instead of moving the folder - new installations only!)
             - MySQL database rebuilt from scratch
             - Updating the RPM is now possible
             - Security improved on header.inc.php (new installations only!)
             - Some useless items are now deleted
             - phpSysInfo default configuration review (config.php+SME styled icon)

* Wed Oct 17 2007 Dietmar Berteld <dietmar@berteld.com>
- [1.4-10] Fixing little bugs and better languages support
	  - Fixed Apache not restarting correctly when uninstalling
	  - Fixed security on Header.inc.php

* Mon Oct 15 2007 Dietmar Berteld <dietmar@berteld.com>
- [1.4-9] Changing to new version 1.4.002
	  Fixed HTTPS redirection (Thanks to Sylvain Gomez)
	  - Improved Apache template for better security
	  - Improved integration in SME (https option; PublicAccess local/global - global&https is default)
	  - Cron job added

* Tue Jul 10 2007 Dietmar Berteld <dietmar@berteld.com>
- [1.4-8] Preparing xmlrpc for synctools; integrate php5 as cgi-bin moduls

* Fri Jun 29 2007 Dietmar Berteld <dietmar@berteld.com>
- [1.4-7] Changing to utf-8

* Thu Jun 19 2007 Dietmar Berteld <dietmar@berteld.com>
- [1.4-6] Fixing MySQL errors

* Thu Jun 17 2007 Dietmar Berteld <dietmar@berteld.com>
- [1.4-5] Fixing max_allowed_packet issue

* Thu Jun 14 2007 Dietmar Berteld <dietmar@berteld.com>
- [1.4-4] New basis eGW 1.4, delete php5-based sync-tool

* Wed May 30 2007 Dietmar Berteld <dietmar@berteld.com>
- [1.2.106-3] Automatic domain configuration and integrate php5-based sync-tool

* Tue May 29 2007 Dietmar Berteld <dietmar@berteld.com>
- [1.2.106-2] Change MySQL-creating method to SME and fixing bugs

* Thu Jan 23 2007 Dietmar Berteld <dietmar@berteld.com>
- [1.2.106-1] Initial version


%prep


%setup

%build
# Creating templates2adjust
perl createlinks


### now in archive
# Default DB parameters
#DEFAULTS1=root/etc/e-smith/db/configuration/defaults/egroupware
#DEFAULTS2=root/etc/e-smith/db/accounts/defaults/egroupware
#mkdir -p $DEFAULTS1
#mkdir -p $DEFAULTS2
#echo "egroupware" > $DEFAULTS1/DbName
#echo "egwuser"    > $DEFAULTS1/DbUser
#echo "on"         > $DEFAULTS1/HTTPS
#echo "eGroupWare" > $DEFAULTS1/Name
#echo "global"     > $DEFAULTS1/PublicAccess
#echo "url"        > $DEFAULTS1/type
#echo "reserved"   > $DEFAULTS2/type


%install
rm -rf $RPM_BUILD_ROOT
(cd root ; find . -depth -print | cpio -dump $RPM_BUILD_ROOT)
rm -f %{name}-%{version}-filelist
/sbin/e-smith/genfilelist $RPM_BUILD_ROOT \
|grep -v egroupware_tmp |grep -v egroupware_sess \
> %{name}-%{version}-filelist

echo "%dir %attr(0755,www,www) /usr/share/egroupware_tmp">> %{name}-%{version}-filelist
echo "%dir %attr(0755,www,www) /usr/share/egroupware_sess">> %{name}-%{version}-filelist
   echo "%attr(0755,www,www) /usr/share/egroupware_sess/.gitignore" >> %{name}-%{version}-filelist

   echo "%attr(0755,www,www)    /usr/share/egroupware_tmp/.gitignore" >> %{name}-%{version}-filelist


%clean
rm -rf $RPM_BUILD_ROOT


%pre
# Checking if eGW files are present before updating
# If present, installation files + MySQL DB are saved
UPDATE=$(ls /var/lib/mysql | grep -c egroupware)
case $UPDATE in
  0)
    echo "Installing eGroupware... Please wait!"
    ;;
  *)
    echo "Updating eGroupware... Please wait!"
#    echo "Backup folder: /opt/eGW_RPM_BACKUP"
    mkdir -p /opt/eGW_RPM_BACKUP
#    cd /opt
#    echo "Backing up installation files..."
#    tar -czf /opt/eGW_RPM_BACKUP/egroupware.tar.gz egroupware
    echo "Backing up MySQL database in /opt/eGW_RPM_BACKUP/..."
    mysqldump egroupware > /opt/eGW_RPM_BACKUP/egroupware$(date +%Y-%m-%d).sql
    /sbin/e-smith/db configuration show egroupware > /opt/eGW_RPM_BACKUP/config.txt
    ;;
esac


%post
# Initializing SME DB
echo "Initializing SME DB"
/etc/e-smith/events/actions/initialize-default-databases 2>/dev/null
echo " "

# Variables
DOMAIN=$(/sbin/e-smith/db configuration get DomainName)
EGPASS=$(/sbin/e-smith/db configuration getprop egroupware DbPassword)
UPDATE=$(ls /usr/share/ | grep -c egroupware)

#echo "Decompressing files..."
#mkdir -p /opt/egroupware/{files/g2data,backup,tmp}
#tar xzf /usr/share/doc/eGroupWare-1.4.004/Sources/eGroupWare-1.4.004.tar.gz -C /opt/egroupware
#tar xzf /usr/share/doc/eGroupWare-1.4.004/Sources/eGroupWare-egw-pear-1.4.004.tar.gz -C /opt/egroupware
#tar xzf /usr/share/doc/eGroupWare-1.4.004/Sources/eGroupWare-gallery-1.4.004.tar.gz -C /opt/egroupware
#echo "Preparing phpSysInfo..."
#cp -f /usr/share/doc/eGroupWare-1.8.005/Sources/phpSysInfo/config.php /usr/share/egroupware/phpsysinfo/
#cp -f /usr/share/doc/eGroupWare-1.8.005/Sources/phpSysInfo/Redhat.png /usr/share/egroupware/phpsysinfo/images/

#echo "Cleaning Install..."
#rm -rf /opt/egroupware/egroupware
#rm -rf /opt/egroupware/html/debian
#rm -f  /opt/egroupware/html/.htaccess

#echo "Setting file access rules:"
#cd /opt/egroupware
#echo "   - Changing owner recursivly..."
#chown -R root:root /opt/egroupware/html
#echo "   - Recursive CHMOD 755 on folders..."
#find html -type d -exec chmod 755 {} \;
#echo "   - Recursive CHMOD 644 on files..."
#find html -type f -exec chmod 644 {} \;
#echo "   - Customization of CHMOD for a few folders..."
#chmod 770     /opt/egroupware/backup
#chmod 770     /opt/egroupware/files
#chmod 770     /opt/egroupware/files/g2data
#chmod 770     /opt/egroupware/tmp
#chown www:www /opt/egroupware/backup
#chown www:www /opt/egroupware/files
#chown www:www /opt/egroupware/files/g2data
#chown www:www /opt/egroupware/tmp

# fixed this one adding .php, not sure if still necessary 
#if [ "$UPDATE" = "0" ] ; then
#  echo "Preparing Site-Mgr..."
#  cd /usr/share/egroupware
#  ln -s sitemgr/sitemgr-link.php
#fi

echo "Preparing header.inc.php..."
# if first install
if [ "$1" = "1" ] ; then
#  0) 
sed 's.egwpass.'$EGPASS'.g' /usr/share/doc/egroupware-epl/Sources/header.inc.php > /usr/share/egroupware/header.inc.php 
echo " done!"
fi
#  *) mv -f /opt/egroupware/html/header.inc.php /opt/egroupware/ 2>/dev/null ;;
#esacc
#chown www:www /opt/egroupware/header.inc.php
#chmod 640     /opt/egroupware/header.inc.php
#cd /opt/egroupware/html
#ln -s ../header.inc.php 2>/dev/null
echo " "

# the integration is complete Ithink now.....
#echo "Preparing Gallery2..."
#if [ -f /usr/share/egroupware/gallery/gallery2/config.php ] ; then
#  touch /usr/share/egroupware/gallery/gallery2/config.php
#else
#  sed 's.egwpass.'$EGPASS'.g' /usr/share/doc/eGroupWare-1.8.005/Sources/Gallery2/config.php > /usr/share/egroupware/gallery/gallery2/config.php
#fi

#chmod 640     /usr/share/egroupware/gallery/gallery2/config.php
#chown www:www /usr/share/egroupware/gallery/gallery2/config.php
#echo " "

### this one will be done by event
echo "MySQL installation:"
if [ "$UPDATE" = "0" ] ; then
  cp /usr/share/doc/egroupware-epl/Sources/egroupware-14.1.sql /etc/e-smith/sql/init/
fi
/sbin/e-smith/expand-template /etc/e-smith/sql/init/80egw_mysql.sql
#/sbin/e-smith/expand-template /etc/e-smith/sql/init/81egw_default
/sbin/e-smith/expand-template /etc/e-smith/sql/init/81egw_domain.sql
/etc/rc.d/init.d/mysql.init start
echo " "

echo "Applying modifications to services..."
/sbin/e-smith/expand-template /etc/httpd/conf/httpd.conf
/etc/rc7.d/S86httpd-e-smith sigusr1
/etc/rc.d/init.d/crond restart
echo " "

echo "-------------------------------------------------------------------------------"
case $UPDATE in
  0) echo "eGroupWare Installation completed, you must finish the installation!" ;;
  *) echo "eGroupWare update completed, you must finish the update!" ;;
esac
echo "Please go to https://$DOMAIN/egroupware/setup"
echo "-------------------------------------------------------------------------------"
echo "For more details, see http://wiki.contribs.org/Egroupware"
echo " "
case $UPDATE in
  0)
    echo "Reminder:"
    echo "        - Website open globally"
    echo "        - https mode enabled with automatic redirection"
    echo "        - Header-Admin-Login = header-admin, pw = 'admin'"
    echo "        - Config-Admin-Login = config-admin, pw = 'admin'"
    echo "        - SME users can login with their user and password (mail auth. method)"
    echo " "
    echo "Start https://$DOMAIN/egroupware/setup"
    echo "Login with the Config-Admin (user=config-admin, pw=admin)"
    echo "ToDo's:"
    echo "      - Create eGroupWare's admin account with an existing SME account/password"
    echo "      - Configure Gallery2 if needed"
    ;;
  *)
    echo "Reminder:"
    echo "        - The old install was backed up and can be found in /opt/eGW_RPM_BACKUP"
    echo "          PLEASE MOVE THIS DIRECTORY TO A SAFE PLACE!!!"
    echo "        - Start https://$DOMAIN/egroupware/setup"
    echo "        - Login with your existing 'Config-Admin' creditentials"
    echo "        - Finish the upgrade if needed"
    echo "        - Configure Gallery2 if needed"
    ;;
esac

echo " "
echo " "
echo "Current configuration:"
/sbin/e-smith/config show egroupware
echo " "
echo "Following DB parameters are allowed:"
echo "    # config setprop egroupware HTTPS on/off"
echo "    # config setprop egroupware PublicAccess local/global"
echo " "
echo "Don't forget to apply modifications with following commands:"
echo "    # expand-template /etc/httpd/conf/httpd.conf"
echo "    # service httpd-e-smith restart"
echo " "
echo "For more details, see http://wiki.contribs.org/Egroupware"
echo "-------------------------------------------------------------------------------"


%preun
if [ $1 = 0 ] ; then
  mv /usr/share/doc/egroupware-epl/Sources/DO_NOT_USE_OR_DELETE/eGW-Full-Uninstall.sh /root/
fi


%postun
if [ $1 = 0 ] ; then
  echo "Restarting services..."
  /sbin/e-smith/expand-template /etc/httpd/conf/httpd.conf
  /etc/rc7.d/S86httpd-e-smith sigusr1
  /etc/rc.d/init.d/crond restart
  echo " "
  echo " "
  echo "Uninstallation finished!"
  echo " "
  echo "If you want to completly remove eGroupWare"
  echo "(installation files and MySQL user+database)"
  echo "please issue the following command at the prompt:"
  echo "# sh /root/eGW-Full-Uninstall.sh"
fi


%files -f %{name}-%{version}-filelist


%defattr(-,root,root)
