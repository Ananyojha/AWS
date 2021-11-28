# AWS VPC Hands-on
TO UNDERSTAND THE `BASICS OF VPC` PLEASE CHECK HERE.
This guide will guide you to CREATE A WEB ADDRESS BOOK. You will get step by step guide to preapare your vpc only.

## COST OF PROJECT 
 _Within Free tier limits_ 

## Aim 
To create a Public Subnet (for EC2 to host our address Book Application) and 2 private Subnet to place our RDS Database (MySql)

## Prerequisite
We assume that you know How to [create a ec2 instance with user data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-add-user-data.html#:~:text=%20When%20working%20with%20instance%20user%20data%2C%20keep,up%20to%20the%20instance%20to%20be...%20More%20) & a [RDS Database](https://aws.amazon.com/getting-started/hands-on/create-mysql-db/)

## Architecture of the Project

Ideally, your DB instance only needs to be available to your web server, and not to the public Internet. You create a VPC with both public and private subnets. The web server is hosted in the public subnet, so that it can reach the public Internet. The DB instance is hosted in a private subnet. 
___________________

## Step by Step setup
It's a best practice to __TAG__ every resource you create, to find it easily. But it's totally optional. 

### Preapare your VPC 

 __Create VPC__
In the menu search for VPC, on left navigation find  `your vpc's ** -> create VPC -> Name : Whatever you like -> IP - 10.0.0.0/16 or any other valid CIDR`

__Create Subnets__
WE WILL CREATE TOTAL 3 SUBNETS :
Repeat the process below 3 times, each time entering the diffrent IP address given below
In the left pane :` Subnets -> Create Subnets -> Choose The __VPC__ you created before -> subnet name: Whatever you like -> IP Ranges (Refer below) -> availabilty zone : different for each subnet ` 
IP Ranges :
- 10.0.1.0/24 : Public Subnet
- 10.0.2.0/24 : Private Subnet 1
- 10.0.3.0/24 : Private subnet 2

- __NOTE__ : After creating the Public Subnet, select it -> actions -> edit -> check the box for Auto-assign IP settings.

__Create Internet Gateway__
Left navigation menu -> `Internet Gateway -> create -> Name Tag: Whatever name You Like -> Create Gateway`
__After Creating it, select the Gateway you created -> actions -> attach to VPC -> The VPC YOU CREATED__

__Create a Route Table__
Left navigation menu -> `Routes -> Name: whatever -> VPC: The VPC YOU CREATED -> add route -> Destination 0.0.0.0/0 -> Target: Internet Gateway -> create`
#### NOTE: after created, select the route -> subnet associations -> associate it to YOUR PUBLIC SUBNET

__Security Groups__
left navigation menu `Security group-> create ->` then :
- for our ec2 instance: `Name: webserver sg -> Decscription: anyting you like` ->  `inbound rule: type : http -> source: anywhere ipv4 `
- #### NOTE: copy ID of this security group after creation
- for our database: `create -> Name: database sg -> Decscription: anyting you like` ->  `inbound rule: type : mysql/aurora-> source: paste the SECURITY GROUP ID`

### Create a ec2 instance

Now create a `t2.micro` insatnce with this [user data](https://github.com/Ananyojha/AWS/blob/main/Bash_scripts/Ec2-for-vpc-blog.sh) + webserver security group 

### Create a MYSQL RDS DATABASE

# Be sure to Delete the VPC and other Resources !!
________________________

### BONUS KNOWLEGDE

__Subnet settings__ - 
Auto-assign IP settings: Enables you to configure the auto-assign IP settings to automatically request a public IPv4 or IPv6 address for a new network interface in this subnet. 
Example -  ip-10-24-34-0.us-west-2.compute.internal

Resource-based Name (RBN) settings: Enables you to specify the hostname type for EC2 instances in this subnet and configure how DNS A and AAAA record queries are handled. 
Example - i-0123456789abcdef.us-west-2.compute.internal

[Aws docs (VPC basics)](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html)

[VPC Best Practices link](https://cloudacademy.com/blog/top-13-amazon-virtual-private-cloud-best-practices/)


__WHAT IS DEFAULT VPC__
A default VPC is a logically isolated virtual network in the AWS cloud that is automatically created for your AWS account the first time you provision Amazon EC2 resources. When you launch an instance without specifying a subnet-ID, your instance will be launched in your default VPC.
1 default VPC / AWS region
You can add Pvt subnets in default if you want.
The default VPC CIDR is 172.31.0.0/16. Default subnets use /20 CIDRs within the default VPC CIDR.





