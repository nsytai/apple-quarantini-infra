output "mapped_domains" {
  value = {
    for domain in google_app_engine_domain_mapping.custom_domain.*:
      domain.domain_name => domain.resource_records
  }
}

output "deployment_bucket" {
  value = google_storage_bucket.app.url
}

output "app_service" {
  value = google_app_engine_standard_app_version.enduserapp.service
}

output "app_version" {
  value = google_app_engine_standard_app_version.enduserapp.version_id
}

output "app_deployment" {
  value = google_app_engine_standard_app_version.enduserapp.deployment
}

output "app_id" {
  value = google_app_engine_standard_app_version.enduserapp.id
}
