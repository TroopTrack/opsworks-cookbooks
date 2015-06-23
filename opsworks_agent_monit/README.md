opsworks_agent_monit Cookbook
=============================

## Modified version based on cookbook from [Chef Cookbooks for the AWS OpsWorks Service](github.com/aws/opsworks-cookbooks) repository.

Required JSON data for Web GUI configuration:
```
{
  "monit_config": {
    "webgui": {
      "ssl_domain": "DOMAIN_NAME_WITH_SSL_CERTIFICATE",
      "username": "DASHBOARD_USER",
      "password": "PASSWORD"
    }
  }
}
```
