#
# Google Cloud Storage resources
#

# Regional bucket to store application source code
resource "google_storage_bucket" "app" {
  name = "${terraform.workspace}-apple-quarantini-app-code"
  bucket_policy_only = true
  location = var.region
  project = data.google_project.project.project_id
  force_destroy = true

  versioning {
    enabled = true
  }
}
