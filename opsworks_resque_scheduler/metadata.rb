name             'opsworks_resque_scheduler'
description      'Installs and configures resque-scheduler on OpsWorks'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

%w[ubuntu debian].each do |os|
  supports os
end