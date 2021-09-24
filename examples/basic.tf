module "dummy" {
    # source = "github.com/production-ready-toolkit/terraform-module-boilerplate"

    source = "../"

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