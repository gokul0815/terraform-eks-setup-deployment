variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.127.16.0/20", "10.127.32.0/20", "10.127.48.0/20"]
  description = "Enter the private subnet cidr"
}

variable "vpc_id" {
  type        = string
  description = "Enter the VPC id"
  default     = "vpc-0376ceab5e1fcc782"
}

variable "user_role_arn" {
  type        = string
  description = "Enter the user role aron"
  default     = "arn:aws:iam::047641257708:user/localadmin"
}

variable "user_name" {
  type        = string
  description = "Enter the user_name"
  default     = "localadmin"
}

variable "bastion_role_name" {
  type        = string
  description = "Enter the role_name"
  default     = "bastion_ec2_role"
}

variable "bastion_role_arn" {
  type        = string
  description = "Enter the Bastion role to access using kubectl"
  default     = "arn:aws:iam::047641257708:role/bastion_ec2_role"
}

variable "private_subnet_ids" {
  type        = list(string)
  default     = ["subnet-0fd00be3973cdd4a9","subnet-0bd6a3d95e253768b"] 
  description = "Enter the private subnet ids"
}

variable "default_tags" {
  type = map(any)
  default = {
    Team  = "cherry"
    Usage = "assignment"
  }
  description = "Enter the tags"
}
