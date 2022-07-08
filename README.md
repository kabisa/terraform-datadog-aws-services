
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit, module description can be added by editing / creating module_description.md)

# Terraform module for Datadog Aws Services

This module uses datadog's feature to monitor AWS Service status page.
This [blog post](https://www.datadoghq.com/blog/aws-outage-datadog-alerts-you/) explains what we've set up
Note that Datadog scrapes the status page from AWS and this can lag a bit.

This module is part of a larger suite of modules that provide alerts in Datadog.
Other modules can be found on the [Terraform Registry](https://registry.terraform.io/search/modules?namespace=kabisa&provider=datadog)

We have two base modules we use to standardise development of our Monitor Modules:
- [generic monitor](https://github.com/kabisa/terraform-datadog-generic-monitor) Used in 90% of our alerts
- [service check monitor](https://github.com/kabisa/terraform-datadog-service-check-monitor)

Modules are generated with this tool: https://github.com/kabisa/datadog-terraform-generator

# Example Usage

```terraform
# tflint-ignore: terraform_module_version
module "aws_eu_west_1" {
  source = "kabisa/aws-services/datadog"

  for_each = toset([
    "cloudformation",
    "cloudtrail",
    "cloudwatch",
    "directconnect",
    "ec2",
    "ecr",
    "ecs",
    "eks",
    "elasticache",
    "elasticsearch",
    "elb",
    "kms",
    "lambda",
    "rds",
    "route53",
    "s3",
    "ses",
    "sns",
    "sqs",
    "vpc",
  ])
  env                  = "prd"
  notification_channel = "mail@example.com"

  include_tags = [
    "region:eu-west-1",
    "service:${each.key}"
  ]
  by_tags = [
    "service"
  ]
  name_suffix = each.key
}

```

Monitors:
* [Terraform module for Datadog Aws Services](#terraform-module-for-datadog-aws-services)
  * [Module Variables](#module-variables)

# Getting started developing
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you cloud a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## Module Variables

| variable             | default                                  | required | description                                                                                  |
|----------------------|------------------------------------------|----------|----------------------------------------------------------------------------------------------|
| enabled              | True                                     | No       |                                                                                              |
| critical_threshold   | 1                                        | No       |                                                                                              |
| warning_threshold    | None                                     | No       |                                                                                              |
| ok_threshold         | 1                                        | No       |                                                                                              |
| no_data_timeframe    | None                                     | No       | How long before we decide we got no data. Note that the scrape interval is approx 10 minutes |
| notify_no_data       | False                                    | No       | Whether we notify ourselves if there's no data. Scrape interval is approx 10 minutes         |
| note                 | Scrape interval is approx 10 minutes     | No       |                                                                                              |
| docs                 | Check the AWS Service status in case this alert is raised. This monitor checks the AWS Status page (https://status.aws.amazon.com/) as per https://www.datadoghq.com/blog/aws-outage-datadog-alerts-you/ | No       |                                                                                              |
| alerting_enabled     | True                                     | No       |                                                                                              |
| include_tags         | ['*']                                    | No       | This allows you to target a specific region or service                                       |
| exclude_tags         | []                                       | No       | This allows you to exclude specific services or regions                                      |
| by_tags              | ['region', 'service']                    | No       | Create an alert per <tags>. Behaves like a group by                                          |
| priority             | 1                                        | No       | Number from 1 (high) to 5 (low).                                                             |
| env                  |                                          | Yes      |                                                                                              |
| service              | AWS                                      | No       |                                                                                              |
| notification_channel |                                          | Yes      |                                                                                              |
| additional_tags      | []                                       | No       |                                                                                              |
| locked               | True                                     | No       |                                                                                              |
| name_prefix          | ""                                       | No       |                                                                                              |
| name_suffix          | ""                                       | No       |                                                                                              |


