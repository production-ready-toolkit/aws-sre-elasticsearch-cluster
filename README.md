# Elasticsearch Module for SRE's 

# Features by Default

* Encryption at rest
* Node to Node Encryption
* Zone Awareness 
* Logs
* HTTPS Enforce

# Variables 

| Variable                      | Default           | Required  | Type      |  Additional Info                                  |
|-------------------------------|-------------------|-----------|-----------|---------------------------------------------------|
| `name`                        | NA                | yes       | `string`  |                                                   |   
| `vpc`                         | NA                | yes       | `string`  | VPC ID                                            |
| `subnets `                    | NA                | yes       | `list`    | Subnet ID's                                       |
| `instance_type`               | NA                | yes       | `string`  |                                                   | 
| `instance_count`              | NA                | yes       | `number`  |                                                   |
| `elasticsearch_version`       | `OpenSearch_1.0`  | no        | `string`  |                                                   |       
| `zone_awareness`              | `true`            | no        | `bool`    |                                                   |
| `cidrs_to_allow`              | `[]`              | no        | `list`    |                                                   |
| `security_groups_to_allow`    | `[]`              | no        | `list`    |                                                   |
| `az_count`                    | `null`            | no        | `number`  | Allowed 2 or 3, default is  length of `subnets`   |
| `kms_key`                     | `""`              | no        | `string`  | If you don't inform, a new will be created        |
| `cloudwatch_rotation`         | `1`               | no        | `number`  | Cloudwatch Expiring Logs                          |
| `tags`                        | `{}`              | no        | `map(any)`| Tags to resources                                 |


# Outputs 

| Variable                      | Value                                     |
|-------------------------------|-------------------------------------------|
| `domain`                      | `aws_elasticsearch_domain.main`           | 
| `security_group`              | `aws_security_group.main`                 | 
| `log_group`                   | `aws_cloudwatch_log_group.main`           |
| `kms`                         | `aws_kms_key.main`                        |

# Usage 

```hcl
module "dummy" {
    source = "github.com/production-ready-toolkit/aws-sre-elasticsearch-cluster"

    name                    = "dummy-elastic"
    elasticsearch_version   = "OpenSearch_1.0"
    instance_type           = "t3.small.elasticsearch"
    instance_count          = 3

    vpc         = "vpc-ba8b92c1"

    subnets     = [
        "subnet-29954875",
        "subnet-c832eeaf",
        "subnet-23a9760d"
    ]

    tags        = {
        "environment" = "production"
    }
}
```

# Examples

# Todo 

* ...