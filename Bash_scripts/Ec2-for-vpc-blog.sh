#create instance
aws ec2 run-instances --image-id $ami --count 1 --instance-type t2.micro --key-name $KeyPair --security-group-ids $sg --subnet-id $subnet
