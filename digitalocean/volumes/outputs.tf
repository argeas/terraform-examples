output "volume_region" {
  value = var.region
}

output "test_volume_name" {
  value = var.test_volume_name
}

output "test_volume_id" {
  value = digitalocean_volume.test_server_volume.id
}
