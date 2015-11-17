name             "opsworks_aws_tags"
maintainer       "Tom Skibinski"
maintainer_email "tom.skibinski@trek10.com"
description      "Adds tags to EC2 instances launched under OpsWorks stack"
version          "0.1.0"

recipe 'opsworks_aws_tags::default', "Adds tags to EC2 instance"

depends 'aws', '= 2.5.0'
