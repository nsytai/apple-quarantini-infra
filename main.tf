#
# Common resources
#

# create dummy application archive on initial deployment
resource "null_resource" "zip_dummyapp" {
  provisioner "local-exec" {
    command = "zip ${local.dummyapp_zip_name} dummyapp/* -j -x \"*venv*\""
  }
}

# upload dummy application archive on initial deployment
resource "null_resource" "upload_dummyapp" {
  depends_on = [google_storage_bucket.app, null_resource.zip_dummyapp]
  provisioner "local-exec" {
    command = "gsutil cp ${local.dummyapp_zip_name} gs://${google_storage_bucket.app.name}/${local.dummyapp_zip_name}"
  }
}
