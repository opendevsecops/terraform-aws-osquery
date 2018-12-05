[![Follow on Twitter](https://img.shields.io/twitter/follow/opendevsecops.svg?logo=twitter)](https://twitter.com/opendevsecops)

# AWS OSQuery Terraform Module

Terraform module which provides ready-made osquery support infrastructure for AWS. Simply configure it and we will run it at minimal cost.

## Getting Started

Getting started is easy. Here is a complete example:

```terraform
module "osquery" {
  source = "opendevsecops/scanner/osquery"

  node_config = <<EOF
{
  "schedule": {
    "crontab": {
      "query": "SELECT * FROM crontab;",
      "interval": 300
    },
    "system_profile": {
      "query": "SELECT * FROM osquery_schedule;"
    },
    "system_info": {
      "query": "SELECT hostname, cpu_brand, physical_memory FROM system_info;",
      "interval": 3600
    }
  }
}
EOF
}
```

This module is automatically published to the Terraform Module Registry. More information about the available inputs, outputs, dependencies, and instructions on how to use the module can be found at the official page [here](https://registry.terraform.io/modules/opendevsecops/osquery).
