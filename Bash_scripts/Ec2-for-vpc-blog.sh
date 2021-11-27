#!/bin/bash -ex

#script
echo '#!/bin/bash -ex
yum -y update
yum -y install httpd php mysql php-mysql
chkconfig httpd on
service httpd start
cd /var/www/html
wget https://s3-us-west-2.amazonaws.com/us-west-2-aws-training/awsu-spl/spl-13/scripts/app.tgz
tar xvfz app.tgz
chown apache:root /var/www/html/rds.conf.php' | tee script.sh 

echo -n 'ENTER KeyPair Name: ' ; read KeyPair
echo -n 'ENTER SECURITY GROUP ID: ' ; read sg
echo -n 'ENTER SUBNET ID: ' ; read subnet


#create instance
aws ec2 run-instances --image-id $ami --count 1 --instance-type t2.micro --key-name $KeyPair --security-group-ids $sg --subnet-id $subnet --user-data file://script.sh
