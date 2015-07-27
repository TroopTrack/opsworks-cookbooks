#
# Cookbook Name:: monit_config
# Recipe:: resque-worker
#

if node[:opsworks][:instance][:hostname] == "backoffice-app1" or node[:opsworks][:instance][:hostname] == "web-app1"
  node[:deploy].each do |application, deploy|
    Chef::Log.info("Configure monit service to resque workers...")

    2.times do |idx|
      idx = idx + 1 # make index 1-based
      template "/etc/monit/conf.d/resque-worker-#{idx}.monitrc" do
        source "resque-worker.erb"
        owner "root"
        group "root"
        mode 0644
        variables(
          :app_name => "resque-worker-#{idx}",
          :pid_file => "#{deploy[:deploy_to]}/shared/pids/resque-worker-#{idx}.pid",
          :resque_group_name => "resque_workers"
        )
        action :create
      end
  end

  service 'monit' do
    action :restart
  end
end
