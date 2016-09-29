#
# cookbook name:: opsworks_resque_scheduler
# recipe:: restart
#

if node[:opsworks][:instance][:hostname] == node['opsworks_resque_scheduler']['admin_instance']
  node[:deploy].each do |application, deploy|
    service 'resque-scheduler' do
      action [:stop, :start]
      provider Chef::Provider::Service::Upstart
    end
  end
end
