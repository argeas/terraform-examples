module "droplet-commons" {
  source = "../modules/droplet-commons"

}

provider "digitalocean" {
  token = module.droplet-commons.do_token

}


