resource "aws_elasticsearch_domain" "main" {
  domain_name           = var.name
  elasticsearch_version = var.elasticsearch_version

  cluster_config {
    instance_type          = var.instance_type
    instance_count         = var.instance_count
    zone_awareness_enabled = var.zone_awareness

    zone_awareness_config {
        availability_zone_count = var.az_count == null ? length(var.subnets) : var.az_count
    }

  }

  vpc_options {
    subnet_ids = var.subnets

    security_group_ids = [
      aws_security_group.main.id
    ]
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  encrypt_at_rest {
    enabled    = true
    kms_key_id = var.kms_key != "" ? var.kms_key : aws_kms_key.main[0].arn
  }

  node_to_node_encryption {
    enabled = true
  }

  ebs_options {
      ebs_enabled = true
      volume_size = 100
      volume_type = "gp2"
  }

  log_publishing_options {
      enabled = true
      cloudwatch_log_group_arn = aws_cloudwatch_log_group.errors.arn
      log_type = "ES_APPLICATION_LOGS"
  }

  log_publishing_options {
      enabled = true
      cloudwatch_log_group_arn = aws_cloudwatch_log_group.search.arn
      log_type = "SEARCH_SLOW_LOGS"
  }

  log_publishing_options {
      enabled = true
      cloudwatch_log_group_arn = aws_cloudwatch_log_group.index.arn
      log_type = "INDEX_SLOW_LOGS"
  }

  domain_endpoint_options {
      enforce_https = var.enforce_https

      custom_endpoint_enabled = var.custom_domain != null ? true : false
      custom_endpoint         = var.custom_domain
      tls_security_policy     = var.tls_security_policy
  } 

    access_policies = var.access_policy == null ? data.template_file.access_policy.rendered : var.access_policy

  tags = var.tags

  #   depends_on = [aws_iam_service_linked_role.es]
}
