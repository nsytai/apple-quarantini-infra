#
# Google Cloud Storage resources
#

resource "google_storage_bucket" "app" {
  name = "${var.env}-app-code"
  bucket_policy_only = true
  location = var.region
}
