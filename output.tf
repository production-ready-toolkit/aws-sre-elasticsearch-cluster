output "domain" {
    value = aws_elasticsearch_domain.main
}
  
output "security_group" {
    value = aws_security_group.main
}

output "log_group" {
    value = aws_cloudwatch_log_group.main
}

output "kms" {
    value = aws_kms_key.main
}