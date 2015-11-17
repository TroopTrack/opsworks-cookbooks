# opsworks_aws_tags

Adds tags to EC2 instances launched under OpsWorks stack

### Usage

Add ``opsworks_aws_tags`` recipe to Setup stage for layer configuration.

In stack custom Json data add a section with list of tags, for example:

```
{
  "aws_tags": {
    "monitor": "true",
    "stage": "staging"
  }
}
```

Ensure that the IAM role used with EC2 instance has the ability to CreateTags, DescribeTags and DeleteTags.

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:CreateTags",
        "ec2:DescribeTags",
        "ec2:DeleteTags"
      ],
      "Resource": [
        "*"
      ],
      "Effect": "Allow"
    }
  ]
}
```

### Recipes

``opsworks_aws_tags::default`` - Adds tags to EC2 instance
