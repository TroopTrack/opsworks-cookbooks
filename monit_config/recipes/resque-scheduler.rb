#
# Cookbook Name:: monit_config
# Recipe:: resque-scheduler
#

if node[:opsworks][:instance][:hostname] == "backoffice-app1" or node[:opsworks][:instance][:hostname] == "web-app1"
  node[:deploy].each do |application, deploy|
    Chef::Log.info("Configure monit service to monitor resque-scheduler...")

    template "/etc/monit/conf.d/resque-scheduler.monitrc" do
      source "resque-scheduler.erb"
      owner "root"
      group "root"
      mode 0644
      variables(
        :app_name => "resque-scheduler",
        :pid_file => "/srv/www/trooptrack_web/shared/pids/resque-scheduler.pid",
        :resque_group_name => "resque_workers"
      )
      action :create
    end
  end

  service 'monit' do
    action :restart
  end
end
