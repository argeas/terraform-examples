# Cluster creation time without autoscaling: 3base nodes, 6:30m
# Cluster creation time with autoscaling: 3base nodes,5:20m 1pool node 1:40m
//  data "digitalocean_kubernetes_versions" "example" {}
//
//  output "k8s-versions" {
//    value = data.digitalocean_kubernetes_versions.example.valid_versions
//  }

data "digitalocean_vpc" "vpc_test_lon1" {
  name   = "vpc_test_lon1"
}

resource "digitalocean_kubernetes_cluster" "cluster-1" {
  name     = var.cluster-name
  region   = var.cluster-region
  version  = var.cluster-version
  tags     = [var.cluster-name]
  vpc_uuid = data.digitalocean_vpc.vpc_test_lon1.id


  node_pool {
    name       = var.cluster-node-pool-1-name
    size       = var.cluster-node-type
    auto_scale = true
    min_nodes  = 3
    max_nodes  = 6
    labels     = {"environment" = "qa", "type"="default"}
    node_count = 3
  }
}


//# Second node pool to attach to the original cluster
resource "digitalocean_kubernetes_node_pool" "pool-1" {
  cluster_id = digitalocean_kubernetes_cluster.cluster-1.id
  name       = "staging-pool"
  size       = "s-2vcpu-4gb"
  auto_scale = true
  node_count = 1
  min_nodes  = 1
  max_nodes  = 3
  tags       = ["staging"]
  labels     = {"environment" = "staging", "type"="couchbase"}
}
//
//# Autoscaling cluster pool
//resource "digitalocean_kubernetes_node_pool" "autoscale-pool-01" {
//  cluster_id = digitalocean_kubernetes_cluster.kubernetes-cluster.id
//  name       = "autoscale-pool-01"
//  size       = var.cluster-node-type
//  auto_scale = true
//  min_nodes  = 0
//  max_nodes  = 5
//
//}

//  https://www.terraform.io/docs/providers/do/r/kubernetes_cluster.html
//  https://www.terraform.io/docs/providers/do/r/kubernetes_node_pool.html
