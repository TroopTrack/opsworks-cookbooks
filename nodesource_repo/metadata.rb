name              'nodesource_repo'
maintainer        'DeveloperTown'
maintainer_email  'admin@developertown.com'
license           'Apache 2.0'
description       'Installs nodejs from the nodesource repo'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.0.1'
recipe            'nodesource_repo', 'Adds the nodesource repo and installs the package'
depends           'apt'

%w{ ubuntu debian }.each do |os|
  supports os
end