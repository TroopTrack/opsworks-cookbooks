#
# Cookbook Name:: unicorn
# Attributes:: customize
#

default[:deploy] ||= {}

node[:deploy].each do |application, deploy|

  # safety first!
  default[:deploy][application] ||= {}
  default[:deploy][application][:nginx] ||= {}

  default[:deploy][application][:nginx][:assets_dir] = 'assets'

end