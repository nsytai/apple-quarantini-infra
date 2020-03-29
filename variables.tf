variable "env" {
  type = "string"
  description = "Environment name. Used as prefix in resources naming."
  default = "dev"
}

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
