#
# Cookbook Name:: copperegg_custom
# Recipe:: default
#

if platform?('redhat', 'centos', 'fedora', 'ubuntu', 'debian', 'amazon')
 
  template '/tmp/auto-copperegg.sh' do
    owner 'root'
    group 'root'
    source 'auto-copperegg.sh.erb'
    mode 0664
    action :create
  end

  script 'auto-copperegg' do
    interpreter 'bash'
    cwd
    user 'root'
    code <<-EOH
        /tmp/auto-copperegg.sh #{node['copperegg_custom']['apikey']} #{node['copperegg_custom']['www']} >> /tmp/auto-copperegg.log 2>&1
    EOH
    action :run
    only_if { !::File.exists?("/usr/local/copperegg/copperegg-metrics/config.yml") } 
  end

end
