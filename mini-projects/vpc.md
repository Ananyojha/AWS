# AWS VPC Hands-on

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



<div style="text-align:center">
	<form action="https://www.ipaddressguide.com/cidr" method="post">
		<p style="background:#fff;border:1px solid #99A8AE;width:180px;padding:5px 5px 5px 5px;font-size:11px;font-family:'Trebuchet MS',Arial,Sans-serif;">
			<a href="https://www.ipaddressguide.com" target="_blank"><img src="https://www.ipaddressguide.com/images/ipaddressguide.png" alt="CIDR to IPv4 Address Range Utility Tool | IPAddressGuide" border="0" width="120" height="12" /></a><br />
			<b>CIDR to IPv4 Conversion</b><br /><br />
			<label>CIDR</label><br />
			<input type="text" name="cidr" value="" style="border:solid 1px #C0C0C0;font-size:9px;width:110px;" /><br />
			<input type="submit" value="Calculate" style="width:100px;font-size:10px;margin-top:3px;padding:2px 3px;color:#FFF;background:#8EB50C;border-width:1px;border-style:solid;">
		</p>
	</form>
</div>
