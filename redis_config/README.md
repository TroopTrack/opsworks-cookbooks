# redis_config cookbook

generate a YAML configuration file redis.yml in your applications configuration folder and fill it with your Redis access information during deployment.

## Usage

In custom layer, must add following recipes to Deploy stage

redis_config

## Sample Chef JSON configuration

```
{
  "deploy" : {
    "app_short_name" : {
      "symlink_before_migrate" : {
        "config/redis.yml": "config/redis.yml"
      },
      "redis" : {
        "host" : "app_short_name.0001.euw1.cache.amazonaws.com",
        "port" : "6379"
      }
    }
  }
}