opsworks_agent_monit Cookbook
=============================

## Modified version based on cookbook from [Chef Cookbooks for the AWS OpsWorks Service](github.com/aws/opsworks-cookbooks) repository.

Required JSON data for Web GUI and SMTP configuration:
```
{
  "monit" : {
    "stack" : "[STAGE]",
    "webgui" : {
      "enable" : true,
      "username" : "monit-admin",
      "password" : "strongPassword",
      "enable_ssl" : true,
      "app_ssl_certificate" : "app_name"
    },
    "smtp" : {
      "address": "smtp.sendgrid.net",
      "port": "587",
      "username": "smtp-user",
      "password": "strongP@ssword"
    },
    "email" : [
      "alets@trooptrack.com",
      "notifications@trooptrack.com"
    ]
  }
}
```

## Default and required values

* node[:monit][:webgui][:enable] = false
* node[:monit][:webgui][:username] = 'monit-admin'
* node[:monit][:webgui][:password] = ''
* node[:monit][:webgui][:enable_ssl] = false
* node[:monit][:webgui][:app_ssl_certificate] = ''

* node[:monit][:smtp][:address] = 'localhost'
* node[:monit][:smtp][:port] = '587'
* node[:monit][:smtp][:username] = ''
* node[:monit][:smtp][:password] = ''

* node[:monit][:email] = []
* node[:monit][:stack] = 'TEST'

when 'centos','redhat','fedora','suse','amazon':
* node[:monit][:pem] = '/etc/monit.pem'

when 'debian','ubuntu':
* node[:monit][:pem] = '/etc/monit/monit.pem'
