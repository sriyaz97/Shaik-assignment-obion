#When creating a VPC on AWS, some of the key design choices to consider include:

* Network architecture: A VPC should be designed with a clear and well-defined network architecture that includes multiple subnets, routing tables, and security groups to segment and protect the network
* IP address range: Choosing an appropriate IP address range for the VPC that does not overlap with any existing networks and provides enough addresses for all resources in the VPC.
* Subnetting: Dividing the VPC into multiple subnets and allocating them to different availability zones for high availability and failover.
* High availability: A VPC should be designed to provide high availability by implementing multiple Availability Zones and using load balancers and Auto Scaling groups
* Scalability: A VPC should be designed to be easily scalable by using Auto Scaling groups, load balancers, and other AWS services that allow for easy scaling.
* Network isolation: A VPC should be designed with network isolation in mind by using VPC peering or VPN connections to connect to other VPCs or on-premises networks.
* Network security: A VPC should be designed with security in mind by implementing security groups and network ACLs to control inbound and outbound traffic.
* Internet connectivity: Deciding whether to allow resources in the VPC to connect to the internet directly or via a NAT gateway or VPN connection.
* Routing: Defining the routing tables and rules that control how traffic flows within the VPC and between the VPC and other networks.
* Security: Implementing security groups and network ACLs to control inbound and outbound traffic and protect resources in the VPC.
* Monitoring and logging: A VPC should be designed with monitoring and logging in mind by using Amazon CloudWatch and AWS CloudTrail to track and analyze network activity.
* Monitoring and logging: Enabling monitoring and logging for the VPC using Amazon CloudWatch and AWS CloudTrail to track and analyze network activity.
* Network isolation: A VPC should be designed with network isolation in mind by using VPC peering or VPN connections to connect to other VPCs or on-premises networks.
* Network Automation: Implementing automation tools like Terraform, CloudFormation, Ansible, Puppet to provision and update VPC resources.
* Cost optimization: Choosing appropriate instance type, storage options and network services based on the workloads and applications that will run in the VPC, in order to optimize costs.


===========in my production vpc archicture I have covered below things==============
1. create a VPC
2. create 3 public and 3 private subnet
3. create Internet Fateway and attach to production-vpc
4. create route table public and private
5. create EIP attach to public subnet and NAT

## Dependency 
- install terraform from where you want to run code
- Need to update below following below steps before proceeding
  * Define CIDR you have planned for your prod in file production.tfvars
  * update region and profile in provider.tf and variables.tf
   

Commands to run terraform code:
terraform validate
terraform init
terraform plan --var-file=production.tfvars
terraform apply --var-file=production.tfvars --auto-approve
terraform destroy --var-file=production.tfvars --auto-approve

terraform graph | dot -Tsvg > graph.svg

