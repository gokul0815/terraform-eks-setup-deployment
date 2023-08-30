private_subnet_cidrs         = ["10.127.16.0/20", "10.127.32.0/20", "10.127.48.0/20"]
vpc_id                       = "vpc-0376ceab5e1fcc782"
bastion_role_arn             = "arn:aws:iam::047641257708:role/bastion_ec2_role"
user_role_arn                = "arn:aws:iam::047641257708:user/localadmin"
user_name                    = "localadmin"
bastion_role_name			 = "bastion_ec2_role"
private_subnet_ids           = ["subnet-0fd00be3973cdd4a9","subnet-0bd6a3d95e253768b"]  