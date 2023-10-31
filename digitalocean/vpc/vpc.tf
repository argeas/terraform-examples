resource "digitalocean_vpc" "vpc-test" {
  name     = "vpc-test-lon1"
  region   = "lon1"
  ip_range = "10.12.0.0/16"
  // This range gives 65,536 IPs
}