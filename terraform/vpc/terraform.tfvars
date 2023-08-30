#region       = "ap-south-1"

##### VPC variables #####

vpc_name                     = "kotak-assignment"
vpc_cidr                     = "10.127.0.0/16"
az                           = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
private_subnet_cidrs         = ["10.127.16.0/20", "10.127.32.0/20", "10.127.48.0/20"]
public_subnet_cidrs          = ["10.127.1.0/24", "10.127.2.0/24"]
ssh_sg_name                  = "ssh_sg"
ingress_with_cidr_blocks_ssh = [{ from_port = 22, to_port = 22, protocol = "tcp", description = "For Ssh", cidr_blocks = "49.207.241.167/32" }, { from_port = 22, to_port = 22, protocol = "tcp", description = "For Ssh", cidr_blocks = "152.58.231.246/32" }]