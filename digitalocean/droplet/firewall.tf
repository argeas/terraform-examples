resource "digitalocean_firewall" "test-firewall" {
  name = "test-server-firewall"

  droplet_ids = [digitalocean_droplet.test_server.id]

  inbound_rule {
      protocol           = "tcp"
      port_range         = "43453"
    #   source_addresses   = ["192.168.1.0/24", "2002:1:2::/48"]
    source_addresses   = ["10.12.0.0/16"]
  }

  inbound_rule {
    protocol           = "tcp"
    port_range         = "8153-8154"
    source_addresses   = ["10.12.0.0/16"]
  }

  inbound_rule {
      protocol           = "icmp"
      source_addresses   = ["0.0.0.0/0"]
  }

  outbound_rule {
      protocol                = "tcp"
      port_range              = "all"
      destination_addresses   = ["0.0.0.0/0"]
  }

  outbound_rule {
      protocol                = "udp"
      port_range              = "all"
      destination_addresses   = ["0.0.0.0/0"]
  }

  outbound_rule {
      protocol                = "icmp"
      destination_addresses   = ["0.0.0.0/0"]
  }
}
