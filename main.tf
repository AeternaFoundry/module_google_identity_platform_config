resource "google_identity_platform_config" "identity_platform_configs" {
  for_each = var.identity_platform_configs

  authorized_domains         = each.value.authorized_domains
  autodelete_anonymous_users = each.value.autodelete_anonymous_users
  project                    = each.value.project

  dynamic "blocking_functions" {
    for_each = each.value.blocking_functions != null ? [each.value.blocking_functions] : []
    content {
      dynamic "forward_inbound_credentials" {
        for_each = blocking_functions.value.forward_inbound_credentials != null ? [blocking_functions.value.forward_inbound_credentials] : []
        content {
          access_token  = forward_inbound_credentials.value.access_token
          id_token      = forward_inbound_credentials.value.id_token
          refresh_token = forward_inbound_credentials.value.refresh_token
        }
      }
      dynamic "triggers" {
        for_each = blocking_functions.value.triggers
        content {
          event_type   = triggers.value.event_type
          function_uri = triggers.value.function_uri
        }
      }
    }
  }

  dynamic "client" {
    for_each = each.value.client != null ? [each.value.client] : []
    content {
      dynamic "permissions" {
        for_each = client.value.permissions != null ? [client.value.permissions] : []
        content {
          disabled_user_deletion = permissions.value.disabled_user_deletion
          disabled_user_signup   = permissions.value.disabled_user_signup
        }
      }
    }
  }

  dynamic "mfa" {
    for_each = each.value.mfa != null ? [each.value.mfa] : []
    content {
      enabled_providers = mfa.value.enabled_providers
      dynamic "provider_configs" {
        for_each = mfa.value.provider_configs != null ? mfa.value.provider_configs : []
        content {
          state = provider_configs.value.state
          dynamic "totp_provider_config" {
            for_each = provider_configs.value.totp_provider_config != null ? [provider_configs.value.totp_provider_config] : []
            content {
              adjacent_intervals = totp_provider_config.value.adjacent_intervals
            }
          }
        }
      }
      state = mfa.value.state
    }
  }

  dynamic "monitoring" {
    for_each = each.value.monitoring != null ? [each.value.monitoring] : []
    content {
      dynamic "request_logging" {
        for_each = monitoring.value.request_logging != null ? [monitoring.value.request_logging] : []
        content {
          enabled = request_logging.value.enabled
        }
      }
    }
  }

  dynamic "multi_tenant" {
    for_each = each.value.multi_tenant != null ? [each.value.multi_tenant] : []
    content {
      allow_tenants           = multi_tenant.value.allow_tenants
      default_tenant_location = multi_tenant.value.default_tenant_location
    }
  }

  dynamic "quota" {
    for_each = each.value.quota != null ? [each.value.quota] : []
    content {
      dynamic "sign_up_quota_config" {
        for_each = quota.value.sign_up_quota_config != null ? [quota.value.sign_up_quota_config] : []
        content {
          quota          = sign_up_quota_config.value.quota
          quota_duration = sign_up_quota_config.value.quota_duration
          start_time     = sign_up_quota_config.value.start_time
        }
      }
    }
  }

  dynamic "sign_in" {
    for_each = each.value.sign_in != null ? [each.value.sign_in] : []
    content {
      allow_duplicate_emails = sign_in.value.allow_duplicate_emails
      dynamic "anonymous" {
        for_each = sign_in.value.anonymous != null ? [sign_in.value.anonymous] : []
        content {
          enabled = anonymous.value.enabled
        }
      }
      dynamic "email" {
        for_each = sign_in.value.email != null ? [sign_in.value.email] : []
        content {
          enabled           = email.value.enabled
          password_required = email.value.password_required
        }
      }
      dynamic "phone_number" {
        for_each = sign_in.value.phone_number != null ? [sign_in.value.phone_number] : []
        content {
          enabled            = phone_number.value.enabled
          test_phone_numbers = phone_number.value.test_phone_numbers
        }
      }
    }
  }

  dynamic "sms_region_config" {
    for_each = each.value.sms_region_config != null ? [each.value.sms_region_config] : []
    content {
      dynamic "allow_by_default" {
        for_each = sms_region_config.value.allow_by_default != null ? [sms_region_config.value.allow_by_default] : []
        content {
          disallowed_regions = allow_by_default.value.disallowed_regions
        }
      }
      dynamic "allowlist_only" {
        for_each = sms_region_config.value.allowlist_only != null ? [sms_region_config.value.allowlist_only] : []
        content {
          allowed_regions = allowlist_only.value.allowed_regions
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

