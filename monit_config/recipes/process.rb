#
# Cookbook Name:: monit_config
# Recipe:: process
#

if node[:opsworks][:instance][:hostname] == node['monit_process']['admin_instance']
  node[:deploy].each do |application, deploy|
    Chef::Log.info("Configure monit service to track #{node[:monit_process][:process_name]} process...")

    template "/etc/monit/conf.d/#{node[:monit_process][:process_name]}.monitrc" do
      source "process.erb"
      owner "root"
      group "root"
      mode 0644
      variables(
        :process_info => node[:monit_process],
        :app_user => deploy[:user],
        :app_group => deploy[:group],
        :app_path => '/srv/www/trooptrack_web',
        :app_env => "staging"
      )
      action :create
    end
  end

  service 'monit' do
    action :restart
  end
end
