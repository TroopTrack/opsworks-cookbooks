# opsworks_resque_scheduler cookbook

Simple cookbook to deploy opsworks_resque_scheduler on an instance at Amazon OpsWorks environment

# Usage

In custom layer, must add following recipes to each stage

**Configure**

opsworks_resque_scheduler::configure

**Deploy**

opsworks_resque_scheduler::restart

# Attributes

It custom JSON data need to define values for opsworks_resque_scheduler, for example
```
{
  "opsworks_resque_scheduler" : {
    "path" : "/srv/www/app_dir/current",
    "rails_env" : "staging"
  }
}
```

# Recipes

**opsworks_resque_scheduler::configure** - configures service
**opsworks_resque_scheduler::restart** - restart worker (after application deploy)

