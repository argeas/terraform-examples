variable "provide_version" {
    type    = string
    default = "1.18.0"
}

variable "docker_compose_version" {
    type    = string
    default = "1.25.5"
}

variable "doctl_version" {
    type    = string
    default = "1.43.0"
}

variable "do_kubernetes_version" {
    type    = string
    default = "1.17.5-do.0"
}

variable "dockerhub_tf_token" {
    type    = string
    default = "YOUR_DOCKERHUB_TOKEN"
}

variable "do_token" {
    type    = string
    default = "YOUR_DIGITAL_OCEAN_TOKEN"
}

variable "do_access_key" {
    type    = string
    default = "YOUR_DIGITAL_OCEAN_ACCESS_KEY"
}

variable "do_secret_key" {
    type    = string
    default = "YOUR_DIGITAL_OCEAN_SECRET"
}
