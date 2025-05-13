
output "name" {
  value = digitalocean_droplet.server.*.name
}

output "ip" {
  value = digitalocean_droplet.server.*.ipv4_address
}
