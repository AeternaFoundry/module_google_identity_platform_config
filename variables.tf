variable "identity_platform_configs" {
  description = <<EOT
Map of identity_platform_configs, attributes below
Optional:
    - authorized_domains
    - autodelete_anonymous_users
    - project
    - blocking_functions (block):
        - forward_inbound_credentials (optional, block):
            - access_token (optional)
            - id_token (optional)
            - refresh_token (optional)
        - triggers (required, block):
            - event_type (required)
            - function_uri (required)
    - client (block):
        - permissions (optional, block):
            - disabled_user_deletion (optional)
            - disabled_user_signup (optional)
    - mfa (block):
        - enabled_providers (optional)
        - provider_configs (optional, block):
            - state (optional)
            - totp_provider_config (optional, block):
                - adjacent_intervals (optional)
        - state (optional)
    - monitoring (block):
        - request_logging (optional, block):
            - enabled (optional)
    - multi_tenant (block):
        - allow_tenants (optional)
        - default_tenant_location (optional)
    - quota (block):
        - sign_up_quota_config (optional, block):
            - quota (optional)
            - quota_duration (optional)
            - start_time (optional)
    - sign_in (block):
        - allow_duplicate_emails (optional)
        - anonymous (optional, block):
            - enabled (required)
        - email (optional, block):
            - enabled (required)
            - password_required (optional)
        - phone_number (optional, block):
            - enabled (required)
            - test_phone_numbers (optional)
    - sms_region_config (block):
        - allow_by_default (optional, block):
            - disallowed_regions (optional)
        - allowlist_only (optional, block):
            - allowed_regions (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    authorized_domains         = optional(list(string))
    autodelete_anonymous_users = optional(bool)
    project                    = optional(string)
    blocking_functions = optional(object({
      forward_inbound_credentials = optional(object({
        access_token  = optional(bool)
        id_token      = optional(bool)
        refresh_token = optional(bool)
      }))
      triggers = list(object({
        event_type   = string
        function_uri = string
      }))
    }))
    client = optional(object({
      permissions = optional(object({
        disabled_user_deletion = optional(bool)
        disabled_user_signup   = optional(bool)
      }))
    }))
    mfa = optional(object({
      enabled_providers = optional(list(string))
      provider_configs = optional(list(object({
        state = optional(string)
        totp_provider_config = optional(object({
          adjacent_intervals = optional(number)
        }))
      })))
      state = optional(string)
    }))
    monitoring = optional(object({
      request_logging = optional(object({
        enabled = optional(bool)
      }))
    }))
    multi_tenant = optional(object({
      allow_tenants           = optional(bool)
      default_tenant_location = optional(string)
    }))
    quota = optional(object({
      sign_up_quota_config = optional(object({
        quota          = optional(number)
        quota_duration = optional(string)
        start_time     = optional(string)
      }))
    }))
    sign_in = optional(object({
      allow_duplicate_emails = optional(bool)
      anonymous = optional(object({
        enabled = bool
      }))
      email = optional(object({
        enabled           = bool
        password_required = optional(bool)
      }))
      phone_number = optional(object({
        enabled            = bool
        test_phone_numbers = optional(map(string))
      }))
    }))
    sms_region_config = optional(object({
      allow_by_default = optional(object({
        disallowed_regions = optional(list(string))
      }))
      allowlist_only = optional(object({
        allowed_regions = optional(list(string))
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.identity_platform_configs : (
        v.blocking_functions == null || (length(v.blocking_functions.triggers) >= 1)
      )
    ])
    error_message = "Each triggers list must contain at least 1 items"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

