resource "docker_container" "bd" {
  name  = "bd-${terraform.workspace}-01"
  image = "postgres:alpine" 

  env = [
    "POSTGRES_USER=admin",
    "POSTGRES_PASSWORD=admin",
    "POSTGRES_DB=miapp"
  ]

  ports {
    internal = "5432"
    external = var.bd_port[terraform.workspace]
  }
}