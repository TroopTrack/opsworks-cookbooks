#
# Author:: Ben Newton (<ben@sumologic.com>)
# Cookbook Name:: sumologic-collector-v2
# Recipe:: Configure json for configuring sources
#
#
# Copyright 2013, Sumo Logic
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This is a one time setup configuration file
#
# Sumo Logic Help Links
# https://service.sumologic.com/ui/help/Default.htm#Unattended_Installation_from_a_Linux_Script_using_the_Collector_Management_API.htm
# https://service.sumologic.com/ui/help/Default.htm#Using_sumo.conf.htm
# https://service.sumologic.com/ui/help/Default.htm#JSON_Source_Configuration.htm

# If there is a json_source specified via attributes use that one
# otherwise pick a default json template based on platform family.
if node['sumologic']['json_template']
  json_source = node['sumologic']['json_template']
else
  case node['platform_family']
      when 'rhel'
        json_source = 'sumo-rhel.json.erb'
      when 'debian'
        json_source = 'sumo-debian.json.erb'
      else
        json_source = 'sumo.json.erb'
  end
end

sources = []
if node['sumologic']['sources']
  json_source = 'custom.json.erb'

  sources = node['sumologic']['sources'].dup # get data as mutable objects

  hostName = node['fqdn'] || Chef::Config[:node_name]
  sources.each do |src|
    src['hostName'] ||= hostName
  end
end

prefix = node['sumologic']['prefix'] ? "#{node['sumologic']['prefix']}_" : ''
sumo_slug_name = node['opsworks']['applications'][0]['slug_name']
source_category = "#{prefix}#{sumo_slug_name}"

template '/etc/sumo.json' do
  cookbook node['sumologic']['json_config_cookbook']
  source json_source
  owner 'root'
  group 'root'
  mode 0644
  variables({
    :sources => sources,
    :app_name => sumo_slug_name,
    :source_category => source_category,
    :app_stage => node['deploy'][sumo_slug_name]['rails_env'],
  })
  action :create
end
