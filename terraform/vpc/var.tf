variable "vpc_name" {
  type        = string
  default     = "platform-vpc"
  description = "Enter vpc name"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  default     = ["10.127.1.0/24", "10.127.2.0/24"]
  description = "Enter the public subnet cidr"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.127.16.0/20", "10.127.32.0/20", "10.127.48.0/20"]
  description = "Enter the public subnet cidr"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.127.0.0/16"
  description = "Enter the vpc cidr"
}

variable "az" {
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  description = "Enter the Availability Zones"
}


variable "default_tags" {
  type = map(any)
  default = {
    Team  = "cherry"
    Usage = "assignment"
  }
  description = "Enter the tags"
}

variable "ssh_sg_name" {
  type        = string
  default     = "ssh-sg"
  description = "Enter name of security group"
}

variable "ingress_with_cidr_blocks_ssh" {
  type        = list(any)
  default     = [{ from_port = 22, to_port = 22, protocol = "tcp", description = "For Ssh", cidr_blocks = "0.0.0.0/0" }]
  description = "Enter the ports and cidrs you want to open"
}