# opsworks_resque cookbook

Simple cookbook to deploy a pool of resque workers directly in Amazon OpsWorks


# Usage

If you're using a _Rails App Server_ layer type you'll need to add the following custom recipes to your layer:

**Setup**

opsworks_resque::setup

**Deploy**

opsworks_resque::restart


# Attributes

Recipe expects an array with the queues of workers to run, for example

```
{
  "opsworks_resque" : {
    "workers" : {
      "super_high,high,medium,*" : 2
    },
    "rails_env" : "ci",
    "path" : "/srv/www/trooptrack_web/current"
  }
}
```


# Recipes

**opsworks_resque::setup** - initial setup
**opsworks_resque::restart** - restart the workers (after deploy)
