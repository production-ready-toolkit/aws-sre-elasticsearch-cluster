data "aws_vpc" "main" {
  id = var.vpc
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "template_file" "access_policy" {
  template = "${file("${path.module}/files/access_policy.json.tpl")}"
  vars = {
    account = data.aws_caller_identity.current.account_id
    region  = data.aws_region.current.name
    domain  = var.name
  }
}