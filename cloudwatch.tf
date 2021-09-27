resource "aws_cloudwatch_log_group" "errors" {
  name_prefix           = format("%s-ES_APPLICATION_LOGS-", var.name)
  retention_in_days     = var.cloudwatch_rotation
  tags                  = var.tags
}

resource "aws_cloudwatch_log_group" "audit" {
  name_prefix           = format("%s-AUDIT_LOGS-", var.name)
  retention_in_days     = var.cloudwatch_rotation
  tags                  = var.tags
}

resource "aws_cloudwatch_log_group" "search" {
  name_prefix           = format("%s-SEARCH_SLOW_LOGS-", var.name)
  retention_in_days     = var.cloudwatch_rotation
  tags                  = var.tags
}

resource "aws_cloudwatch_log_group" "index" {
  name_prefix           = format("%s-INDEX_SLOW_LOGS-", var.name)
  retention_in_days     = var.cloudwatch_rotation
  tags                  = var.tags
}

resource "aws_cloudwatch_log_resource_policy" "main" {
  policy_name = format("%s-es-cluster", var.name)

  policy_document = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "es.amazonaws.com"
      },
      "Action": [
        "logs:PutLogEvents",
        "logs:PutLogEventsBatch",
        "logs:CreateLogStream"
      ],
      "Resource": "arn:aws:logs:*"
    }
  ]
}
CONFIG
}