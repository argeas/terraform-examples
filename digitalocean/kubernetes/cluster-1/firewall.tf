resource "digitalocean_firewall" "cluster-1-firewall" {
  name = "cluster-1-firewall"

  // The below tag belongs to the cluster and it is used to attach this firewall to it.
  tags = ["k8s:b247d79d-7e86-48ff-9ad4-049ef65c408e"]

  inbound_rule {
    protocol           = "icmp"
    source_addresses   = ["10.0.0.0/8", "172.16.0.0/20", "192.168.0.0/16"]
  }

  inbound_rule {
    protocol           = "tcp"
    port_range         = "all"
    source_addresses   = ["10.0.0.0/8", "172.16.0.0/20", "192.168.0.0/16"]
  }

  inbound_rule {
    protocol           = "udp"
    port_range         = "all"
    source_addresses   = ["10.0.0.0/8", "172.16.0.0/20", "192.168.0.0/16"]
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
