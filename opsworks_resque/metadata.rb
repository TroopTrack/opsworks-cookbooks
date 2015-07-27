name             'opsworks_resque'
description      'Installs and configures resque on AWS OpsWorks'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.0'

%w[ubuntu debian].each do |os|
  supports os
end