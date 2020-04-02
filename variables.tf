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

variable "app_shell" {
  type = "string"
  default = "gunicorn -b :$PORT main:app"
  description = "shell command to run in App Engine (any packages defined should be included in requirements.txt)"
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

variable "mapped_domains" {
  type = "list"
  default = []
  description = "List of domain names for mapping"
}

variable "project_services" {
  type = "list"
  default = [
    "appengine.googleapis.com",
    "bigquery.googleapis.com",
    "bigquerystorage.googleapis.com",
    "cloudapis.googleapis.com",
    "cloudbuild.googleapis.com",
    "clouddebugger.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudtrace.googleapis.com",
    "containerregistry.googleapis.com",
    "datastore.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "pubsub.googleapis.com",
    "servicemanagement.googleapis.com",
    "serviceusage.googleapis.com",
    "sql-component.googleapis.com",
    "storage-api.googleapis.com",
    "storage-component.googleapis.com",
  ]
  description = "List of APIs should be enabled on the project"
}
