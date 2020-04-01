variable "region" {
  type = "string"
  default = "us-west2"
  description = "GCP region to deploy resources to"
}

variable "app_runtime" {
  type = "string"
  default = "python37"
  description = "App Engine runtime"
}

variable "app_url_regexp" {
  type = "string"
  default = "/.*"
  description = "App Engine regexp url"
}

variable "project" {
  type = "string"
  description = "GCP Project to deploy to"
}

variable "admin_service_accounts" {
  type = "list"
  default = []
}

variable "admin_users" {
  type = "list"
  default = []
}
