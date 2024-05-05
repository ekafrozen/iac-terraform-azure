terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

resource "azurerm_resource_group" "example" {
  name     = "${var.name}"
  location = "${var.location}"
}

resource "azurerm_storage_account" "example" {
  name                     = "${var.storageaccountname}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "${element(split("_", var.boot_diagnostics_sa_type),0)}"
  account_replication_type = "${element(split("_", var.boot_diagnostics_sa_type),1)}"

  tags = {
    environment = "${var.environment}"
  }
}

resource "azurerm_storage_container" "example" {
  name                  = "${var.name}"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "${var.container_access_type}"
}

resource "azurerm_storage_blob" "example" {
  name                   = "${var.name}"
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "${var.type}"
  source                 = "${var.source}"
}

  ports {
    internal = 80
    external = 8000
  }
}
