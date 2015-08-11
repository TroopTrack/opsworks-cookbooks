#
# cookbook name:: beauregard
# recipe:: configure
#

if node[:opsworks][:instance][:hostname] == node['beauregard']['admin_instance']
  node[:deploy].each do |application, deploy|
    Chef::Log.info("Configuring beauregard email processor for application #{application}")

    template "/etc/init/beauregard.conf" do
      source "beauregard.conf.erb"
      mode "0644"
    end
  end
end
