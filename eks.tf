module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.10.1"

  name               = "laboratorio-eks-2-2"
  kubernetes_version = "1.30"

  # Torna o endpoint do cluster acessível publicamente (kubectl)
  endpoint_public_access = true

  # Permite que sua conta AWS seja admin no cluster
  enable_cluster_creator_admin_permissions = true

  # **NODE GROUPS (CLÁSSICOS)**
  eks_managed_node_groups = {
    default = {
      name           = "ng-default"
      instance_types = ["t3.micro"]
      desired_size   = 1
      min_size       = 1
      max_size       = 2
    }
  }

  # Usa a VPC que você já criou no projeto
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}




  