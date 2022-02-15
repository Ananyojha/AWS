[OFFICIAL MS](https://techcommunity.microsoft.com/t5/fasttrack-for-azure/how-to-create-a-vpn-between-azure-and-aws-using-only-managed/ba-p/2281900)

[yt](https://youtu.be/w5OFuy1-ngw)

[linkedin tutorial check](https://www.linkedin.com/pulse/azure-vnet-aws-vpc-thor-draper-jr)

[Cloudthat](https://blog.cloudthat.com/site-to-site-vpn-connection-between-aws-azure/)

[azure site to site using powershell](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-create-site-to-site-rm-powershell)

[AZURE BGP REUIRES](https://docs.microsoft.com/en-us/azure/vpn-gateway/bgp-howto#about)

PC PEERING 
There is no charge for creating VPC peering connections, however, data transfer across peering connections is charged. See the Data Transfer section of the EC2 Pricing page for data transfer rates.
Can I use AWS Direct Connect or hardware VPN connections to access VPCs I'm peered with?
No. "Edge to Edge routing" isn't supported in Amazon VPC. Refer to the VPC Peering Guide for additional information
Is VPC peering traffic within the region encrypted?
No. Traffic between instances in peered VPCs remains private and isolated – similar to how traffic between two instances in the same VPC is private and isolated.
Termination of PEERING connection from either side means .. No data transfer possible
 If I peer VPC A to VPC B and I peer VPC B to VPC C, does that mean VPCs A and C are peered? --no

Inter-Region VPC Peering traffic goes over the AWS backbone that has in-built redundancy and dynamic bandwidth allocation. There is no single point of failure for communication.
If an Inter-Region peering connection does go down, the traffic will not be routed over the internet.

 -  VPC PEERING use cases 
VPC Peering can be useful in various scenarios such as:Interconnected applications requiring private and secure access inside AWS. Typically, this can happen within large enterprises that have multiple VPCs running in a single region.Systems have been deployed in different AWS accounts by some business units and are required to be either shared or consumed privately. Some large organizations have different AWS accounts for various business departments, units, and/or teams, along with varying communication needs among the groups.Better integrated access of systems, such as when a customer can peer their VPC with their core suppliers
