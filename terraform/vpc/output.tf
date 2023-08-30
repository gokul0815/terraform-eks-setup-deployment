output "vpc" {
  description = "ID of project VPC"
  value       = module.vpc
}

output "vpcId" {
  description = "ID of project VPC"
  value       = module.vpc.vpc_id
}

output "ssh_sg_group" {
  description = "ssh info"
  value       = module.ssh-security-group
}
