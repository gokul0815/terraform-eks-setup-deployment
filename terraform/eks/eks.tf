module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "kotak-assignment"
  cluster_version = "1.27"

  cluster_endpoint_public_access  = false

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }

  }

  vpc_id                   = var.vpc_id
  subnet_ids               = var.private_subnet_ids
  control_plane_subnet_ids = var.private_subnet_ids

  self_managed_node_group_defaults = {
    instance_type                          = "t3a.medium"
    update_launch_template_default_version = true
    iam_role_additional_policies = {
      AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    }
  }

  eks_managed_node_group_defaults = {
    instance_types = ["t3a.medium", "t3.medium", "t3.large", "t3a.large"]
  }

  eks_managed_node_groups = {
    blue = {}
    green = {
      min_size     = 1
      max_size     = 10
      desired_size = 1

      instance_types = ["t3.large"]
      capacity_type  = "SPOT"
    }
  }

  manage_aws_auth_configmap = true

  aws_auth_roles = [
    {
      rolearn  = "var.bastion_role_arn"
      username = "var.bastion_role_name"
      groups   = ["system:masters"]
    },
  ]

  aws_auth_users = [
    {
      userarn  = "var.user_role_arn"
      username = "var.user_name"
      groups   = ["system:masters"]
    },
  ]

  tags = {
    Team  = "cherry"
    Usage = "assignment"
  }
}
