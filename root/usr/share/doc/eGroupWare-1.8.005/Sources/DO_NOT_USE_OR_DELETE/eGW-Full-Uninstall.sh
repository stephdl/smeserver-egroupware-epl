#!/bin/sh
# Use this file to finish eGroupware removal ONLY if you don't want to keep it on your system.

clear
echo "WARNING!!!"
echo "This script will delete:"
echo "     - eGroupware MySQL database"
echo "     - eGroupware MySQL User"
echo "     - eGroupware DB entries..."
echo "     - All Install files"
echo -n "ARE YOU SURE YOU WANT TO DELETE PERMANENTLY EGROUPWARE? (y/n) [n] "
read del
if [ "$del" = "y" -o "$del" = "Y" ]; then
	echo "Deleting MySQL database..."
	mysql -u root -e "DROP DATABASE egroupware"
	echo "Deleting MySQL User..."
	mysql -u root -e "REVOKE ALL PRIVILEGES ON egroupware.* FROM 'egwuser'@'localhost';"
	mysql -u root -e "DROP USER egwuser@localhost;"
	echo "Removing SME DB entries..."
	/sbin/e-smith/config delete egroupware
	echo "Removing Install files..."
	rm -rf  /usr/share/egroupware
	rm -rf  /usr/share/egroupware_sess
	rm -rf  /usr/share/egroupware_tmp
	rm -rf  /var/lib/egroupware
	echo "Done!"
	rm -f /root/eGW-Full-Uninstall.sh
fi
