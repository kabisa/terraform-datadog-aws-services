variable "enabled" {
  type    = bool
  default = true
}

variable "critical_threshold" {
  type    = number
  default = 1
}

variable "warning_threshold" {
  type    = number
  default = null
}

variable "ok_threshold" {
  type    = number
  default = 1
}

variable "no_data_timeframe" {
  description = "How long before we decide we got no data. Note that the scrape interval is approx 10 minutes"
  type        = number
  # Disabled because the measurements are data-blank moment-data-blank moment...
  # We don't want to monitor if DD is scraping
  # We only need to know if the service is down
  default = null
}

variable "notify_no_data" {
  description = "Whether we notify ourselves if there's no data. Scrape interval is approx 10 minutes"
  # Disabled because the measurements are data-blank moment-data-blank moment...
  # We don't want to monitor if DD is scraping
  # We only need to know if the service is down
  default = false
}

variable "note" {
  type    = string
  default = "Scrape interval is approx 10 minutes"
}

variable "docs" {
  type    = string
  default = "Check the AWS Service status in case this alert is raised. This monitor checks the AWS Status page (https://status.aws.amazon.com/) as per https://www.datadoghq.com/blog/aws-outage-datadog-alerts-you/ "
}

variable "alerting_enabled" {
  type    = bool
  default = true
}

variable "include_tags" {
  type        = list(string)
  description = "This allows you to target a specific region or service"
  default     = ["*"]
}

variable "exclude_tags" {
  type        = list(string)
  description = "This allows you to exclude specific services or regions"
  default     = []
}

variable "by_tags" {
  description = "Create an alert per <tags>. Behaves like a group by"
  type        = list(string)
  default     = ["region", "service"]
}

variable "priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 1
}

variable "env" {
  type = string
}

variable "service" {
  type    = string
  default = "AWS"
}

variable "notification_channel" {
  type = string
}

variable "additional_tags" {
  type    = list(string)
  default = []
}

variable "locked" {
  type    = bool
  default = true
}

variable "name_prefix" {
  type    = string
  default = ""
}

variable "name_suffix" {
  type    = string
  default = ""
}
