output "identity_platform_configs_id" {
  description = "Map of id values across all identity_platform_configs, keyed the same as var.identity_platform_configs except keys with no id are omitted"
  value       = { for k, v in google_identity_platform_config.identity_platform_configs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "identity_platform_configs_authorized_domains" {
  description = "Map of authorized_domains values across all identity_platform_configs, keyed the same as var.identity_platform_configs except keys with no authorized_domains are omitted"
  value       = { for k, v in google_identity_platform_config.identity_platform_configs : k => v.authorized_domains if v.authorized_domains != null && length(v.authorized_domains) > 0 }
}
output "identity_platform_configs_autodelete_anonymous_users" {
  description = "Map of autodelete_anonymous_users values across all identity_platform_configs, keyed the same as var.identity_platform_configs except keys with no autodelete_anonymous_users are omitted"
  value       = { for k, v in google_identity_platform_config.identity_platform_configs : k => v.autodelete_anonymous_users if v.autodelete_anonymous_users != null }
}
output "identity_platform_configs_blocking_functions" {
  description = "Map of blocking_functions values across all identity_platform_configs, keyed the same as var.identity_platform_configs except keys with no blocking_functions are omitted"
  value       = { for k, v in google_identity_platform_config.identity_platform_configs : k => one(v.blocking_functions) if v.blocking_functions != null && length(v.blocking_functions) > 0 }
}
output "identity_platform_configs_client" {
  description = "Map of client values across all identity_platform_configs, keyed the same as var.identity_platform_configs except keys with no client are omitted"
  value       = { for k, v in google_identity_platform_config.identity_platform_configs : k => one(v.client) if v.client != null && length(v.client) > 0 }
  sensitive   = true
}
output "identity_platform_configs_mfa" {
  description = "Map of mfa values across all identity_platform_configs, keyed the same as var.identity_platform_configs except keys with no mfa are omitted"
  value       = { for k, v in google_identity_platform_config.identity_platform_configs : k => one(v.mfa) if v.mfa != null && length(v.mfa) > 0 }
}
output "identity_platform_configs_monitoring" {
  description = "Map of monitoring values across all identity_platform_configs, keyed the same as var.identity_platform_configs except keys with no monitoring are omitted"
  value       = { for k, v in google_identity_platform_config.identity_platform_configs : k => one(v.monitoring) if v.monitoring != null && length(v.monitoring) > 0 }
}
output "identity_platform_configs_multi_tenant" {
  description = "Map of multi_tenant values across all identity_platform_configs, keyed the same as var.identity_platform_configs except keys with no multi_tenant are omitted"
  value       = { for k, v in google_identity_platform_config.identity_platform_configs : k => one(v.multi_tenant) if v.multi_tenant != null && length(v.multi_tenant) > 0 }
}
output "identity_platform_configs_name" {
  description = "Map of name values across all identity_platform_configs, keyed the same as var.identity_platform_configs except keys with no name are omitted"
  value       = { for k, v in google_identity_platform_config.identity_platform_configs : k => v.name if v.name != null && length(v.name) > 0 }
}
output "identity_platform_configs_project" {
  description = "Map of project values across all identity_platform_configs, keyed the same as var.identity_platform_configs except keys with no project are omitted"
  value       = { for k, v in google_identity_platform_config.identity_platform_configs : k => v.project if v.project != null && length(v.project) > 0 }
}
output "identity_platform_configs_quota" {
  description = "Map of quota values across all identity_platform_configs, keyed the same as var.identity_platform_configs except keys with no quota are omitted"
  value       = { for k, v in google_identity_platform_config.identity_platform_configs : k => one(v.quota) if v.quota != null && length(v.quota) > 0 }
}
output "identity_platform_configs_sign_in" {
  description = "Map of sign_in values across all identity_platform_configs, keyed the same as var.identity_platform_configs except keys with no sign_in are omitted"
  value       = { for k, v in google_identity_platform_config.identity_platform_configs : k => one(v.sign_in) if v.sign_in != null && length(v.sign_in) > 0 }
}
output "identity_platform_configs_sms_region_config" {
  description = "Map of sms_region_config values across all identity_platform_configs, keyed the same as var.identity_platform_configs except keys with no sms_region_config are omitted"
  value       = { for k, v in google_identity_platform_config.identity_platform_configs : k => one(v.sms_region_config) if v.sms_region_config != null && length(v.sms_region_config) > 0 }
}

