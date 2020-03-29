#
# IAM resources (service accounts, bindings etc)
#

# Service account to tuse with App Engine to run application
resource "google_service_account" "appengine" {
  account_id = "${var.env}-appengine"
  display_name = "AppEngine for ${var.env} environment"
}

# IAM bindings
resource "google_storage_bucket_iam_policy" "appangine" {
  bucket = google_storage_bucket.app.name
  policy_data = data.google_iam_policy.appengine.policy_data
}

# Policy prvides appengine service account running app
# readonly privileges to the bucket contents
data "google_iam_policy" "appengine" {
  binding {
    members = [google_service_account.appengine.email]
    role = "roles/storage.objectViewer"
  }
}
