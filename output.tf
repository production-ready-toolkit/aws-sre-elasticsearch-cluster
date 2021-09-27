output "domain" {
    value = aws_elasticsearch_domain.main
}
  
output "security_group" {
    value = aws_security_group.main
}

output "log_group_errors" {
    value = aws_cloudwatch_log_group.errors
}

output "log_group_search" {
    value = aws_cloudwatch_log_group.search
}

output "log_group_index" {
    value = aws_cloudwatch_log_group.index
}

output "kms" {
    value = aws_kms_key.main
}