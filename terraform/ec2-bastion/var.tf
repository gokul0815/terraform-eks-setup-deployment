
variable "bastion_ami_id" {
  type        = string
  description = "Enter the ami id"
  default     = "ami-08e5424edfe926b43"
}
variable "bastion_instance_type" {
  type        = string
  description = "Enter the instance_type"
  default     = "t2.micro"
}

variable "bastion_availability_zone" {
  type        = list(any)
  description = "Enter the availability zone"
}

variable "bastion_key_name" {
  type        = string
  description = "Enter the key name"
  default     = "my-vpc"
}

variable "bastion_aws_subnet" {
  type        = list(any)
  description = "Enter the subnet id"
}

variable "bastion_instance_name" {
  type        = string
  description = "Enter the instance name"
  default     = "terraform_bastion_host"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Enter the instance name"
}

variable "default_tags" {
  type = map(any)
  default = {
    Team  = "cherry"
    Usage = "assignment"
  }
  description = "Enter the tags"
}