name             'sumologic-collector-v2'
maintainer       'Tom Skibinski'
maintainer_email 'tom.skibinski@trek10.com'
license          'Apache v2.0'
description      'Installs/Configures sumologic-collector'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.2.2'
attribute 'sumologic/credentials/bag_name',
  :display_name => "Credentials bag name",
  :type => "string",
  :required => "required"
attribute 'sumologic/credentials/item_name',
  :display_name => "Credentials item name",
  :type => "string",
  :required => "required"
