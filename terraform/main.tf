provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "default" {
  name       = "terraform-key"
  public_key = file(var.ssh_public_key_path)
}

resource "digitalocean_droplet" "server" {
  count    = 1
  image    = "ubuntu-22-04-x64"
  name     = "server-${count.index + 1}"
  region   = "nyc2"
  size     = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.default.id]
  tags     = ["dev"]

  # user_data = file("setup.sh")
}
# Create a PostgreSQL database cluster
#Provision a managed database instance
resource "digitalocean_database_cluster" "mysql" {
  name       = "mysql-cluster"
  engine     = "mysql"
  version    = "8"
  size       = "db-s-1vcpu-1gb"
  region     = "nyc2"
  node_count = 1
  tags       = ["dev"]
}

resource "digitalocean_database_db" "database" {
  cluster_id = digitalocean_database_cluster.mysql.id
  name       = "test"
}

#create a cluster user
resource "digitalocean_database_user" "user" {
  cluster_id = digitalocean_database_cluster.mysql.id
  name       = "dev"
}


