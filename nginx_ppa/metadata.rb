name              'nginx_ppa'
maintainer        'DeveloperTown'
maintainer_email  'admin@developertown.com'
license           'Apache 2.0'
description       'Installs the latest nginx package from the ppa'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.0.1'
recipe            'nginx_ppa', 'Adds the ppa repo and installs the package'
depends           'apt'

%w{ ubuntu debian }.each do |os|
  supports os
end