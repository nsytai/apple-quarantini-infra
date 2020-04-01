#
# IAM resources (service accounts, bindings etc)
#

resource "google_storage_bucket_iam_member" "appengine_svcacc_app_bucket_viewer" {
  bucket = google_storage_bucket.app.name
  member = "serviceAccount:${data.google_project.project.project_id}@appspot.gserviceaccount.com"
  role = "roles/storage.objectViewer"
}

resource "google_storage_bucket_iam_member" "custom_svcacc_app_bucket_admin" {
  count = length(var.admin_service_accounts)
  bucket = google_storage_bucket.app.name
  member = "serviceAccount:${var.admin_service_accounts[count.index]}"
  role = "roles/storage.admin"
}

resource "google_storage_bucket_iam_member" "custom_user_app_bucket_admin" {
  count = length(var.admin_users)
  bucket = google_storage_bucket.app.name
  member = "user:${var.admin_users[count.index]}"
  role = "roles/storage.admin"
}
