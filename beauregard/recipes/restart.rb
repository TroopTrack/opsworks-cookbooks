#
# cookbook name:: beauregard
# recipe:: restart
#

if node[:opsworks][:instance][:hostname] == node['beauregard']['admin_instance']
  node[:deploy].each do |application, deploy|
    service 'beauregard' do
      action [:stop, :start]
      provider Chef::Provider::Service::Upstart
    end
  end
end
