#
# cookbook name:: beauregard
# recipe:: restart
#

node[:deploy].each do |application, deploy|
  service 'beauregard' do
    action [:stop, :start]
    provider Chef::Provider::Service::Upstart
  end
end
