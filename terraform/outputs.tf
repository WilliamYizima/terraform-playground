output "droplet_ip" {
  value = digitalocean_droplet.teste-dev[*].ipv4_address
}
