resource "aws_cloudwatch_log_group" "main" {
  name_prefix           = format("%s-es-cluster", var.name)
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