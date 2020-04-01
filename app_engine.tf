#
# App Engine resources
#

# Deploy dummy application to create a deployment point
resource "google_app_engine_standard_app_version" "enduserapp" {
  depends_on = [null_resource.upload_dummyapp, null_resource.zip_dummyapp, google_storage_bucket.app]
  version_id = "${terraform.workspace}green"
  runtime = "python37"
  project = data.google_project.project.project_id
  service = "${terraform.workspace}app"

  entrypoint {
    shell = "gunicorn -b :$PORT main:app"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.app.name}/${local.dummyapp_zip_name}"
    }
  }
}
