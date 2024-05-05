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
    environment = "${var.staging}"
  }
}

resource "azurerm_service_plan" "example" {
  name                = "${var.example}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "${var.os_type}"
  sku_name            = "${var.sku_name}"
}

resource "azurerm_linux_function_app" "example" {
  name                = "${var.name}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  service_plan_id            = azurerm_service_plan.example.id

  site_config {}
}

resource "azurerm_function_app_function" "example" {
  name            = "${var.name}"
  function_app_id = "${var.function_app_id}"
  language        = "${var.language}"
  test_data = jsonencode({
    "name" = "${var.name}"
  })
  config_json = jsonencode({
    "bindings" = [
      {
        "authLevel" = "${var.authLevel}"
        "direction" = "${var.direction}"
        "methods" = [
          "get",
          "post",
        ]
        "name" = "${var.name}"
        "type" = "${var.type}"
      },
      {
        "direction" = "${var.direction}"
        "name"      = "${var.name}"
        "type"      = "${var.type}"
      },
    ]
  })
}

  ports {
    internal = 80
    external = 8000
  }
}
