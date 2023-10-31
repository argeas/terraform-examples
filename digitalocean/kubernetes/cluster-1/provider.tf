module "droplet-commons" {
  source = "../../modules/droplet-commons"
}

provider digitalocean {
  token = module.droplet-commons.do_token
}

provider kubernetes {
  host = digitalocean_kubernetes_cluster.cluster-1.endpoint
  client_certificate = base64decode(digitalocean_kubernetes_cluster.cluster-1.kube_config[0].client_certificate)
  client_key = base64decode(digitalocean_kubernetes_cluster.cluster-1.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.cluster-1.kube_config[0].cluster_ca_certificate)
}

# resource "local_file" "kubeconfig" {
#   content = "${digitalocean_kubernetes_cluster.k8s-test-cluster.kube_config.0.raw_config}"
#   filename = "${path.module}/.kubeconfig"
# }
