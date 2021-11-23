#!/bin/sh
yum -y install httpd php mysql php-mysql
chkconfig httpd on
/etc/init.d/httpd start
cd /tmp
wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/SPLs/04/examplefiles-as.zip
unzip examplefiles-as.zip
mv examplefiles-as/* /var/www/html
