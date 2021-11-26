# AWS VPC Hands-on

## Architecture of the Project

Because your DB instance only needs to be available to your web server, and not to the public Internet, you create a VPC with both public and private subnets. The web server is hosted in the public subnet, so that it can reach the public Internet. The DB instance is hosted in a private subnet. 



Subnet settings - 
Auto-assign IP settings: Enables you to configure the auto-assign IP settings to automatically request a public IPv4 or IPv6 address for a new network interface in this subnet. For more information about these settings, see Work with IP addresses.
Example -  ip-10-24-34-0.us-west-2.compute.internal

Resource-based Name (RBN) settings: Enables you to specify the hostname type for EC2 instances in this subnet and configure how DNS A and AAAA record queries are handled. 
Example - i-0123456789abcdef.us-west-2.compute.internal
Aws docs (VPC basics) -  https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html

Best Practices link -  https://cloudacademy.com/blog/top-13-amazon-virtual-private-cloud-best-practices/

If the instances reside in subnets in different Availability Zones, you will be charged $0.01 per GB for data transfer

A default VPC is a logically isolated virtual network in the AWS cloud that is automatically created for your AWS account the first time you provision Amazon EC2 resources. When you launch an instance without specifying a subnet-ID, your instance will be launched in your default VPC.
1 default VPC / AWS region
You can add Pvt subnets in default if you want.
The default VPC CIDR is 172.31.0.0/16. Default subnets use /20 CIDRs within the default VPC CIDR.


## Delete the VPC and other Resources


Work with VPCs and subnets
PDF
Kindle
RSS
The following procedures are for manually creating a VPC and subnets. You also have to manually add gateways and routing tables. Alternatively, you can use the Amazon VPC wizard to create a VPC plus its subnets, gateways, and routing tables in one step. For more information, see Example VPC configurations.

Tasks

Create a VPC
View your VPC
Create a subnet in your VPC
View your subnet
Associate a secondary IPv4 CIDR block with your VPC
Associate an IPv6 CIDR block with your VPC
Associate an IPv6 CIDR block with your subnet
Launch an instance into your subnet
Delete your subnet
Disassociate an IPv4 CIDR block from your VPC
Disassociate an IPv6 CIDR block from your VPC or subnet
Delete your VPC
Create a VPC
Follow the steps in this section to create a VPC using the Amazon VPC console.

To create a VPC using the console

Open the Amazon VPC console at https://console.aws.amazon.com/vpc/.

In the navigation pane, choose Your VPCs, Create VPC.

Specify the following VPC details as needed.

Name tag: Optionally provide a name for your VPC. Doing so creates a tag with a key of Name and the value that you specify.

IPv4 CIDR block: Specify an IPv4 CIDR block for the VPC. The smallest CIDR block you can specify is /28, and the largest is /16. We recommend that you specify a CIDR block from the private (non-publicly routable) IP address ranges as specified in RFC 1918; for example, 10.0.0.0/16, or 192.168.0.0/16.

Note
You can specify a range of publicly routable IPv4 addresses. However, we currently do not support direct access to the internet from publicly routable CIDR blocks in a VPC. Windows instances cannot boot correctly if launched into a VPC with ranges from 224.0.0.0 to 255.255.255.255 (Class D and Class E IP address ranges).

IPv6 CIDR block: Optionally associate an IPv6 CIDR block with your VPC. Choose one of the following options, and then choose Select CIDR:

Amazon-provided IPv6 CIDR block: Requests an IPv6 CIDR block from Amazon's pool of IPv6 addresses. For Network Border Group, select the group from which AWS advertises IP addresses.

IPv6 CIDR owned by me: (BYOIP) Allocates an IPv6 CIDR block from your IPv6 address pool. For Pool, choose the IPv6 address pool from which to allocate the IPv6 CIDR block.

Tenancy: Select a tenancy option. Dedicated tenancy ensures that your instances run on single-tenant hardware. For more information, see Dedicated instances in the Amazon EC2 User Guide for Linux Instances.

(Optional) Add or remove a tag.

[Add a tag] Choose Add tag and do the following:

For Key, enter the key name.

For Value, enter the key value.

[Remove a tag] Choose Remove to the right of the tag’s Key and Value.

Choose Create.

Alternatively, you can use a command line tool.

To create a VPC using a command line tool

create-vpc (AWS CLI)

New-EC2Vpc (AWS Tools for Windows PowerShell)

To describe a VPC using a command line tool

describe-vpcs (AWS CLI)

Get-EC2Vpc (AWS Tools for Windows PowerShell)

For more information about IP addresses, see IP Addressing in your VPC.

After you've created a VPC, you can create subnets. For more information, see Create a subnet in your VPC.

View your VPC
Follow the steps in this section to view the details about your VPC.

To view VPC details using the console

Open the Amazon VPC console at https://console.aws.amazon.com/vpc/.

In the navigation pane, choose VPCs.

Select the VPC, and then choose View Details.

To describe a VPC using a command line tool

describe-vpcs (AWS CLI)

Get-EC2Vpc (AWS Tools for Windows PowerShell)

To view all of your VPCs across Regions

Open the Amazon EC2 Global View console at https://console.aws.amazon.com/ec2globalview/home.

For more information about using Amazon EC2 Global View, see List and filter resources using the Amazon EC2 Global View in the Amazon EC2 User Guide for Linux Instances.

Create a subnet in your VPC
To add a new subnet to your VPC, you must specify an IPv4 CIDR block for the subnet from the range of your VPC. You can specify the Availability Zone in which you want the subnet to reside. You can have multiple subnets in the same Availability Zone.

You can optionally specify an IPv6 CIDR block for your subnet if an IPv6 CIDR block is associated with your VPC.

To create the subnet in a Local Zone, or a Wavelength Zone, you must enable the Zone. For information about how to enable Wavelength Zones, see Enabling zones in the Amazon EC2 User Guide for Linux Instances.

To add a subnet to your VPC using the console

Open the Amazon VPC console at https://console.aws.amazon.com/vpc/.

In the navigation pane, choose Subnets, Create subnet.

Specify the subnet details as necessary and choose Create.

Name tag: Optionally provide a name for your subnet. Doing so creates a tag with a key of Name and the value that you specify.

VPC: Choose the VPC for which you're creating the subnet.

Availability Zone: Optionally choose a Zone in which your subnet will reside, or leave the default No Preference to let AWS choose an Availability Zone for you.

For information about the Regions and Zones, see Regions and zones in the Amazon EC2 User Guide for Linux Instances.

IPv6-only: Specify if this subnet should be an IPv6-only subnet. This option is only available if the subnet is in a VPC with an IPv6 CIDR block assigned. If you choose this option, you will not define an IPv4 CIDR block range for the subnet. Any EC2 instances launched in this subnet will given an IPv6 address only, not an IPv4 address. To launch an EC2 instance into an IPv6-only subnet, you must use EC2 instances built on the Nitro System.

IPv4 CIDR block: Specify an IPv4 CIDR block for your subnet, for example, 10.0.1.0/24. For more information, see VPC and subnet sizing for IPv4. If you chose IPv6-only, this option is unavailable.

IPv6 CIDR block: If you've associated an IPv6 CIDR block with your VPC, choose Custom IPv6 CIDR. Specify the hexadecimal pair value for the subnet, or leave the default value. If you chose IPv6-only, choose an IPv6 CIDR block.

(Optional) If required, repeat the steps above to create more subnets in your VPC.

Alternatively, you can use a command line tool.

To add a subnet using a command line tool

create-subnet (AWS CLI)

New-EC2Subnet (AWS Tools for Windows PowerShell)

After you create a subnet, you can do the following:

Configure your routing. To make your subnet a public subnet, you must attach an internet gateway to your VPC. For more information, see Create and attach an internet gateway. You can then create a custom route table, and add route to the internet gateway. For more information, see Create a custom route table. For other routing options, see Route tables for your VPC.

Modify the subnet settings to specify that all instances launched in that subnet receive a public IPv4 address, or an IPv6 address, or both. For more information, see IP addressing behavior for your subnet.

Modify the subnet settings to change resource-based name (RBN) settings. For more information, see Amazon EC2 instance hostname types.

Create or modify your security groups as needed. For more information, see Security groups for your VPC.

Create or modify your network ACLs as needed. For more information, see Network ACLs.

Share the subnet with other accounts. For more information, see Share a subnet.

View your subnet
Follow the steps in this section to view the details about your subnet.

To view subnet details using the console

Open the Amazon VPC console at https://console.aws.amazon.com/vpc/.

In the navigation pane, choose Subnets.

Select the subnet, and then choose View Details.

To describe a subnet using a command line tool

describe-subnets (AWS CLI)

Get-EC2Subnet (AWS Tools for Windows PowerShell)

To view all of your subnets across Regions

Open the Amazon EC2 Global View console at https://console.aws.amazon.com/ec2globalview/home.

For more information about using Amazon EC2 Global View, see List and filter resources using the Amazon EC2 Global View in the Amazon EC2 User Guide for Linux Instances.

Associate a secondary IPv4 CIDR block with your VPC
You can add another IPv4 CIDR block to your VPC. Ensure that you have read the applicable restrictions.

After you've associated a CIDR block, the status goes to associating. The CIDR block is ready to use when it's in the associated state.

The Amazon Virtual Private Cloud Console provides the status of the request at the top of the page.

To add a CIDR block to your VPC using the console

Open the Amazon VPC console at https://console.aws.amazon.com/vpc/.

In the navigation pane, choose Your VPCs.

Select the VPC, and then choose Actions, Edit CIDRs.

Choose Add new IPv4 CIDR. Enter the CIDR block; for example, 10.2.0.0/16. Choose Save.

Choose Close.

To add a CIDR block using a command line tool

associate-vpc-cidr-block (AWS CLI)

Register-EC2VpcCidrBlock (AWS Tools for Windows PowerShell)

After you've added the IPv4 CIDR blocks that you need, you can create subnets. For more information, see Create a subnet in your VPC.

Associate an IPv6 CIDR block with your VPC
You can associate an IPv6 CIDR block with any existing VPC. The VPC must not have an existing IPv6 CIDR block associated with it.

To associate an IPv6 CIDR block with a VPC using the console

Open the Amazon VPC console at https://console.aws.amazon.com/vpc/.

In the navigation pane, choose Your VPCs.

Select the VPC, and then choose Actions, Edit CIDRs.

Choose Add new IPv6 CIDR.

For IPv6 CIDR block, do one of the following:

Choose Amazon-provided IPv6 CIDR block to request an IPv6 CIDR block from Amazon's pool of IPv6 addresses. For Network border group, select the group from where AWS advertises the IP addresses.

Choose IPv6 CIDR owned by me to allocate an IPv6 CIDR block from your IPv6 address pool. For Pool, choose the IPv6 address pool from which to allocate the IPv6 CIDR block.

Choose Select CIDR.

Choose Close.

To associate an IPv6 CIDR block with a VPC using a command line tool

associate-vpc-cidr-block (AWS CLI)

Register-EC2VpcCidrBlock (AWS Tools for Windows PowerShell)

Associate an IPv6 CIDR block with your subnet
You can associate an IPv6 CIDR block with an existing subnet in your VPC. The subnet must not have an existing IPv6 CIDR block associated with it.

To associate an IPv6 CIDR block with a subnet using the console

Open the Amazon VPC console at https://console.aws.amazon.com/vpc/.

In the navigation pane, choose Subnets.

Select your subnet, choose Subnet Actions, Edit IPv6 CIDRs.

Choose Add IPv6 CIDR. Specify the hexadecimal pair for the subnet (for example, 00) and confirm the entry by choosing the tick icon.

Choose Close.

Alternatively, you can use a command line tool.

To associate an IPv6 CIDR block with a subnet using the command line

associate-subnet-cidr-block (AWS CLI)

Register-EC2SubnetCidrBlock (AWS Tools for Windows PowerShell)

Launch an instance into your subnet
After you've created your subnet and configured your routing, you can launch an instance into your subnet using the Amazon EC2 console.

For complete information about the options available in the Amazon EC2 launch wizard, see Launching an instance in the Amazon EC2 User Guide for Linux Instances.

To launch an instance into your subnet using the console

Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.

On the dashboard, choose Launch Instance.

Follow the directions in the wizard. Select an AMI and an instance type and choose Next: Configure Instance Details.

Note
If you want your instance to communicate over both IPv4 and IPv6, you must select a supported instance type. All current generation instance types support IPv4 and IPv6 addresses. To launch an EC2 instance into an IPv6-only subnet, you must use an EC2 instance built on the Nitro System.

On the Configure Instance Details page, ensure that you have selected the required VPC in the Network list, then select the subnet in to which to launch the instance. Keep the other default settings on this page and choose Next: Add Storage.

On the next pages of the wizard, you can configure storage for your instance, and add tags. On the Configure Security Group page, choose from any existing security group that you own, or follow the wizard directions to create a new security group. Choose Review and Launch when you're done.

Review your settings and choose Launch.

Select an existing key pair that you own or create a new one, and then choose Launch Instances when you're done.

Important
If you launched an EC2 instance that uses an Amazon Linux 2 AMI into an IPv6-only subnet, you must connect to the instance and run sudo amazon-linux-https disable. This lets your AL2 instance connect to the yum repository in S3 over IPv6 using the http patch service.

Alternatively, you can use a command line tool.

To launch an instance into your subnet using a command line tool

run-instances (AWS CLI)

New-EC2Instance (AWS Tools for Windows PowerShell)

Delete your subnet
If you no longer need your subnet, you can delete it. You must terminate any instances in the subnet first.

To delete your subnet using the console

Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.

Terminate all instances in the subnet. For more information, see Terminate Your Instance in the EC2 User Guide.

Open the Amazon VPC console at https://console.aws.amazon.com/vpc/.

In the navigation pane, choose Subnets.

Select the subnet to delete and choose Actions, Delete subnet.

In the Delete Subnet dialog box, choose Delete subnet.

Alternatively, you can use a command line tool.

To delete a subnet using a command line tool

delete-subnet (AWS CLI)

Remove-EC2Subnet (AWS Tools for Windows PowerShell)

Disassociate an IPv4 CIDR block from your VPC
If your VPC has more than one IPv4 CIDR block associated with it, you can disassociate an IPv4 CIDR block from the VPC. You cannot disassociate the primary IPv4 CIDR block. You can only disassociate an entire CIDR block; you cannot disassociate a subset of a CIDR block or a merged range of CIDR blocks. You must first delete all subnets in the CIDR block.

To remove a CIDR block from a VPC using the console

Open the Amazon VPC console at https://console.aws.amazon.com/vpc/.

In the navigation pane, choose Your VPCs.

Select the VPC, and choose Actions, Edit CIDRs.

Under VPC IPv4 CIDRs, choose the delete button (a cross) for the CIDR block to remove.

Choose Close.

Alternatively, you can use a command line tool.

To remove an IPv4 CIDR block from a VPC using a command line tool

disassociate-vpc-cidr-block (AWS CLI)

Unregister-EC2VpcCidrBlock (AWS Tools for Windows PowerShell)

Disassociate an IPv6 CIDR block from your VPC or subnet
If you no longer want IPv6 support in your VPC or subnet, but you want to continue using your VPC or subnet for creating and communicating with IPv4 resources, you can disassociate the IPv6 CIDR block.

To disassociate an IPv6 CIDR block, you must first unassign any IPv6 addresses that are assigned to any instances in your subnet. For more information, see Unassign an IPv6 address from an instance.

To disassociate an IPv6 CIDR block from a subnet using the console

Open the Amazon VPC console at https://console.aws.amazon.com/vpc/.

In the navigation pane, choose Subnets.

Select your subnet, choose Actions, Edit IPv6 CIDRs.

Remove the IPv6 CIDR block for the subnet by choosing the cross icon.

Choose Close.

To disassociate an IPv6 CIDR block from a VPC using the console

Open the Amazon VPC console at https://console.aws.amazon.com/vpc/.

In the navigation pane, choose Your VPCs.

Select your VPC, choose Actions, Edit CIDRs.

Remove the IPv6 CIDR block by choosing the cross icon.

Choose Close.

Note
Disassociating an IPv6 CIDR block does not automatically delete any security group rules, network ACL rules, or route table routes that you've configured for IPv6 networking. You must manually modify or delete these rules or routes.

Alternatively, you can use a command line tool.

To disassociate an IPv6 CIDR block from a subnet using a command line tool

disassociate-subnet-cidr-block (AWS CLI)

Unregister-EC2SubnetCidrBlock (AWS Tools for Windows PowerShell)

To disassociate an IPv6 CIDR block from a VPC using a command line tool

disassociate-vpc-cidr-block (AWS CLI)

Unregister-EC2VpcCidrBlock (AWS Tools for Windows PowerShell)

Delete your VPC
To delete a VPC using the VPC console, you must first terminate or delete the following components:

All instances in the VPC - For information about how to terminate an instance, see Terminate your instance in the Amazon EC2 User Guide for Linux Instances.

VPC peering connections

Interface endpoints

NAT gateways

When you delete a VPC using the VPC console, we also delete the following VPC components for you:
