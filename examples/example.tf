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
