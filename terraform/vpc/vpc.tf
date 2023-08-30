module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  name                 = var.vpc_name
  cidr                 = var.vpc_cidr
  azs                  = var.az
  private_subnets      = var.private_subnet_cidrs
  public_subnets       = var.public_subnet_cidrs
  enable_dns_hostnames = true
  enable_nat_gateway   = true
}

module "ssh-security-group" {
  source                   = "terraform-aws-modules/security-group/aws"
  name                     = var.ssh_sg_name
  vpc_id                   = module.vpc.vpc_id
  ingress_cidr_blocks      = []
  ingress_rules            = []
  egress_rules             = ["all-all"]
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks_ssh
}

