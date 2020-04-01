terraform {
  backend "gcs" {
    bucket = "apple-quarantini-tf-state"
    prefix = "terraform"
  }
}
