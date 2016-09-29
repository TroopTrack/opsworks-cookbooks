#
# cookbook name:: opsworks_resque
# recipe:: restart
#

if node[:opsworks][:instance][:hostname] == node['opsworks_resque']['admin_instance']
  node[:deploy].each do |application, deploy|
    service "resque-worker" do
      action [:stop, :start]
      provider Chef::Provider::Service::Upstart
    end
  end
end
