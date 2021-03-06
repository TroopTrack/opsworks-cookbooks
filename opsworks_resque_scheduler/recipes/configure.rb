#
# cookbook name:: opsworks_resque_scheduler
# recipe:: configure
#

if node[:opsworks][:instance][:hostname] == node['opsworks_resque_scheduler']['admin_instance']
  node[:deploy].each do |application, deploy|
    Chef::Log.info("Configuring resque-scheduler for application #{application}")

    template "/etc/init/resque-scheduler.conf" do
      source "resque-scheduler.conf.erb"
      mode "0644"
    end
  end
end
