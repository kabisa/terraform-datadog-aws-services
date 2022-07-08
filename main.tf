module "aws_services" {
  source  = "kabisa/service-check-monitor/datadog"
  version = "2.0.0"

  name        = "Service Status"
  metric_name = "aws.status"

  alert_message    = "The AWS service {{service}} is not reporting correctly to Datadog."
  recovery_message = "The AWS service {{service}} integration has recovered"

  by_tags             = var.by_tags
  include_tags        = var.include_tags
  exclude_tags        = var.exclude_tags
  require_full_window = false
  no_data_timeframe   = var.no_data_timeframe
  notify_no_data      = var.notify_no_data

  # monitor level vars
  enabled            = var.enabled
  alerting_enabled   = var.alerting_enabled
  critical_threshold = var.critical_threshold
  warning_threshold  = var.warning_threshold
  ok_threshold       = var.ok_threshold
  priority           = var.priority
  docs               = var.docs
  note               = var.note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
