echo"set the default variables first."
echo -n "keypair path - " ; read KEYPAIR
echo -n "instance name " ; read Instance
echo -n " Ami -- "; read AMIID
echo -n "keyname -- " ; read KEYNAME
echo -n "Sg -- " ; read EC2SECURITYGROUPID
echo -n "subnets fill karde $SUBNET 1 OR 2 HAI.." 


chmod 400 $KEYPAIR.pem

ssh -i KEYPAIR.pem ec2-user@$Instance


aws configure


aws autoscaling create-launch-configuration --image-id $AMIID --instance-type t3.micro --key-name $KEYNAME --security-groups $EC2SECURITYGROUPID --user-data file:///home/ec2-user/as-bootstrap.sh --launch-configuration-name lab-lc

aws autoscaling create-auto-scaling-group --auto-scaling-group-name lab-as-group --launch-configuration-name lab-lc --load-balancer-names LOADBALANCER --max-size 4 --min-size 1 --vpc-zone-identifier $SUBNET1,$SUBNET2

