name             'beauregard'
description      'Configures beauregard email processor as Upstart service'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w[ubuntu debian].each do |os|
  supports os
end