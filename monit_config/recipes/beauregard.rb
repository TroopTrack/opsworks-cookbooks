#
# Cookbook Name:: monit_config
# Recipe:: beauregard
#

if node[:opsworks][:instance][:hostname] == node['beauregard']['admin_instance']
  node[:deploy].each do |application, deploy|
    Chef::Log.info("Configure monit service to track beauregard process...")

    template "/etc/monit/conf.d/beauregard.monitrc" do
      source "beauregard.erb"
      owner "root"
      group "root"
      mode 0644
      action :create
    end
  end

  service 'monit' do
    action :restart
  end
end
