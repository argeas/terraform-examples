variable "region" {
  type    = string
  default = "lon1"
}

variable "cluster-name" {
  type    = string
  default = "cluster-1"
}

variable "cluster-region" {
  type    = string
  default = "lon1"
}

variable "cluster-version" {
  type    = string
  default = "1.17.5-do.0"
}

variable "cluster-node-pool-1-name" {
  type    = string
  default = "worker-pool-1"
}

variable "cluster-node-pool-2-name" {
  type    = string
  default = "worker-pool-2"
}

variable "cluster-node-type" {
  type    = string
  default = "s-2vcpu-4gb"
}

variable "cluster-node-pool-node-count" {
  type    = number
  default = 1
}

