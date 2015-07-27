#
# cookbook name:: opsworks_resque
# recipe:: restart
#

if node[:opsworks][:instance][:hostname] == "backoffice-app1" or node[:opsworks][:instance][:hostname] == "web-app1"
  node[:deploy].each do |application, deploy|
    service "resque-worker" do
      action [:stop, :start]
      provider Chef::Provider::Service::Upstart
    end
  end
end
