#
# App Engine resources
#

# Deployment point for further deployments
resource "google_app_engine_standard_app_version" "enduserapp" {
  depends_on = [null_resource.upload_dummyapp, null_resource.zip_dummyapp, google_storage_bucket.app]
  version_id = "${terraform.workspace}green"
  runtime = var.app_runtime
  project = data.google_project.project.project_id
  service = "${terraform.workspace}-app"

  entrypoint {
    shell = var.app_shell
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.app.name}/${local.dummyapp_zip_name}"
    }
  }
}

resource "google_app_engine_domain_mapping" "custom_domain" {
  count = length(var.mapped_domains)
  domain_name = var.mapped_domains[count.index]
  project = data.google_project.project.project_id

  ssl_settings {
    ssl_management_type = "AUTOMATIC"
  }
}
