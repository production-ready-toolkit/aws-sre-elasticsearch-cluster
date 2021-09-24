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
      cloudwatch_log_group_arn = aws_cloudwatch_log_group.main.arn
      log_type = "ES_APPLICATION_LOGS"
  }

  #   access_policies = ""

  tags = var.tags

  #   depends_on = [aws_iam_service_linked_role.es]
}
