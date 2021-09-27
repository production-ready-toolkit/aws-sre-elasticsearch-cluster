variable "name" {
  type = string
}

variable "elasticsearch_version" {
  type      = string
  default   = "OpenSearch_1.0"
}

variable "instance_type" {
  type = string
}

variable "instance_count" {
    description = "Number of cluster nodes"
    type = number
}

variable "zone_awareness" {
  description   = ""
  type          = bool
  default       = true
}   

variable "az_count" {
    description = "value"
    type        = number
    default     = null
}

variable "vpc" {
    description = "VPC ID"
    type        = string
}

variable "subnets" {
    description = "List with subnet ID's to create a subnet group"
    type        = list
}

variable "cidrs_to_allow" {
    description = "A list with CIDR's to enable on ingress and egress"
    type        = list
    default     = []
}

variable "security_groups_to_allow" {
    description = "A list with security group ID's to enable on ingress and egress"
    type        = list
    default     = []
}

variable "kms_key" {
    description = "The ARN of the key that you wish to use if encrypting at rest"
    type        = string
    default     = ""
}

variable "cloudwatch_rotation" {
  description   = "Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653, and 0. If you select 0, the events in the log group are always retained and never expire"
  type          = number
  default       = 1
}

variable "access_policy" {
  description = "IAM policy document specifying the access policies for the domain."
  type        = string
  default     = null
}

variable "custom_domain" {
  description = "Support for a custom DNS domain for cluster"
  type        = string
  default     = null 
}

variable "enforce_https" {
  description = "Only HTTPS"
  type        = bool 
  default     = true
}

variable "custom_domain_acm_certificate" {
  description = "ACM certificate ARN for your custom endpoint"
  type        = string
  default     = null
}

variable "tls_security_policy" {
  description = "ame of the TLS security policy that needs to be applied to the HTTPS endpoint. Valid values: Policy-Min-TLS-1-0-2019-07 and Policy-Min-TLS-1-2-2019-07"
  type        = string
  default     = "Policy-Min-TLS-1-2-2019-07"
}

variable "tags" {
    type    = map(any)
    default = {}
}