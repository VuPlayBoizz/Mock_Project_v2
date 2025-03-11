##################################################
# NGINX INGRESS CONTROLLER - HELM INSTALLATION
##################################################

# Lấy token xác thực cho Kubernetes cluster
data "aws_eks_cluster_auth" "eks" {
  name = module.eks-cluster.cluster_name
}

# Provider Kubernetes kết nối tới EKS cluster
provider "kubernetes" {
  host                   = module.eks-cluster.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks-cluster.cluster_ca)
  token                  = data.aws_eks_cluster_auth.eks.token
}

# Provider Helm kết nối tới EKS cluster
provider "helm" {
  kubernetes {
    host                   = module.eks-cluster.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks-cluster.cluster_ca)
    token                  = data.aws_eks_cluster_auth.eks.token
  }
}

# Triển khai nginx ingress controller thông qua Helm chart
resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"

  create_namespace = true

  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }

  set {
    name  = "controller.admissionWebhooks.enabled"
    value = "true"
  }

  # Đảm bảo EKS & Worker Nodes được deploy trước
  depends_on = [
    module.eks-cluster,
    module.eks-worker-node
  ]
}
