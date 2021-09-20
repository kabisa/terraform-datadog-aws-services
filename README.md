
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit)

# Terraform module for Datadog Aws Services

Monitors:
* [Terraform module for Datadog Aws Services](#terraform-module-for-datadog-aws-services)
  * [Module Variables](#module-variables)

# Getting started
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in the repo.
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## Module Variables

| variable             | default                                  | required | description                                                        |
|----------------------|------------------------------------------|----------|--------------------------------------------------------------------|
| enabled              | True                                     | No       |                                                                    |
| critical_threshold   | 1                                        | No       |                                                                    |
| warning_threshold    | null                                     | No       |                                                                    |
| ok_threshold         | 1                                        | No       |                                                                    |
| no_data_timeframe    | null                                     | No       | Minutes of no data coming in. Scrape interval is approx 10 minutes |
| notify_no_data       | False                                    | No       | Minutes of no data coming in. Scrape interval is approx 10 minutes |
| note                 | Scrape interval is approx 10 minutes     | No       |                                                                    |
| docs                 | Check the AWS Service status in case this alert is raised. This monitor checks the AWS Status page (https://status.aws.amazon.com/) as per https://www.datadoghq.com/blog/aws-outage-datadog-alerts-you/ | No       |                                                                    |
| alerting_enabled     | True                                     | No       |                                                                    |
| include_tags         | ['*']                                    | No       | This allows you to target a specific region or service             |
| exclude_tags         | []                                       | No       | This allows you to exclude specific services or regions            |
| by_tags              | ['region', 'service']                    | No       | Create an alert per <tags>. Behaves like a group by                |
| priority             | 1                                        | No       | Number from 1 (high) to 5 (low).                                   |
| env                  |                                          | Yes      |                                                                    |
| service              | AWS                                      | No       |                                                                    |
| notification_channel |                                          | Yes      |                                                                    |
| additional_tags      | []                                       | No       |                                                                    |
| locked               | True                                     | No       |                                                                    |
| name_prefix          | ""                                       | No       |                                                                    |
| name_suffix          | ""                                       | No       |                                                                    |


