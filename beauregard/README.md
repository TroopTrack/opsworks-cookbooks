# beauregard cookbook

Simple cookbook to configure beauregard on an AWS OpsWorks instance with Upstart

# Usage

In custom layer, must add following recipes to each stage

**Configure**

beauregard::configure

**Deploy**

beauregard::restart

# Attributes

It custom JSON data need to define values for beauregard, for example
```
{
  "beauregard" : {
    "path" : "/srv/www/app_dir/current",
    "logfile" : "./log/beauregard.log",
    "pidfile" : "./tmp/pids/beauregard.pid",
    "rails_env" : "staging"
  }
}
```

# Recipes

**beauregard::configure** - configures Upstart service
**beauregard::restart** - restart email processor (after application deploy)

