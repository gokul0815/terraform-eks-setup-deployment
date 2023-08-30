module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "bastion-server"
  iam_instance_profile   = aws_iam_instance_profile.bastion-profile.name
  ami                    = var.bastion_ami_id
  instance_type          = var.bastion_instance_type
  key_name               = var.bastion_key_name
  monitoring             = false
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.bastion_aws_subnet[0]
  associate_public_ip_address = true
  root_block_device	 = [{
      delete_on_termination = true
      volume_size           = 30
      volume_type           = "gp3"
  }]



  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
