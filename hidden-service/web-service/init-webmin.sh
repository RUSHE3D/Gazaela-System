#!/bin/bash

# Start the Tor service
service tor start

# Start Apache
apachectl -D FOREGROUND

# Set Webmin user and password
echo 'superadmin:superadmin' > /etc/webmin/miniserv.users

# Start Webmin
/usr/share/webmin/miniserv.pl /etc/webmin/miniserv.conf
