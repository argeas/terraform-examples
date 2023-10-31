##### BUILD SERVER VOLUME
resource "digitalocean_volume" "test_server_volume" {
  name                    = "test-server-volume"
  region                  = var.region
  size                    = 100
  initial_filesystem_type = "xfs"
  description             = "Build server volume"
}