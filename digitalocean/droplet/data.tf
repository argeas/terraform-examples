module "droplet-commons" {
  source = "../../modules/droplet-commons"
}

data "template_file" "cloud_init_userdata" {

  template = file("${path.module}/cloud-init.yaml")

  vars = {
    DOCKERHUB_TOKEN        = module.droplet-commons.dockerhub_tf_token
    DOCKER_COMPOSE_VERSION = module.droplet-commons.docker_compose_version
    DOCTL_VERSION          = module.droplet-commons.doctl_version
  }
}