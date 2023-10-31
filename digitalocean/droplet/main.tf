data "digitalocean_vpc" "vpc_test_lon1" {
  name   = "vpc-test-lon1"
}

resource "digitalocean_droplet" "test_server" {
    image              = "debian-10-x64"
    name               = var.instance_name
    region             = var.region
    size               = "s-2vcpu-4gb"
    private_networking = true
    tags               = ["test_server"]
    vpc_uuid           = data.digitalocean_vpc.vpc_test_lon1.id
    user_data          = data.template_file.cloud_init_userdata.rendered

}

output "instance_ip" {
  value = formatlist("Public_IPv4: %s ,Private_IPv4: %s ",digitalocean_droplet.test_server.ipv4_address,digitalocean_droplet.test_server.ipv4_address_private)

}

resource "digitalocean_volume_attachment" "test_server_attachment" {
  droplet_id = digitalocean_droplet.test_server.id
  volume_id  = data.terraform_remote_state.do-volumes.outputs.test_volume_id
}
