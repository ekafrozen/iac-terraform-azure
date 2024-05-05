variable "name" {
  description = "Nazwa"
}

variable "location" {
  description = "Lokalizacja"
}

variable "account_tier" {
  description = "Poziom konta"
  default = ""
}

variable "account_replication_type" {
  description = "Typ replikcaji konta"
  default = ""
}

variable "environment" {
  description = "Lokalizacja"
}

variable "container_access_type" {
  description = "Typ kontenera"
  default = ""
}

variable "type" {
  description = "Typ"
  default = ""
}

variable "source" {
  description = "Zrodlo"
  default = ""
}

variable "authLevel" {
  description = "Poziom ident"
  default = ""
}

