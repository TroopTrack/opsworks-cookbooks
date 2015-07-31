#
# cookbook name:: beauregard
# recipe:: configure
#

node[:deploy].each do |application, deploy|
  Chef::Log.info("Configuring beauregard email processor for application #{application}")

  template "/etc/init/beauregard.conf" do
    source "beauregard.conf.erb"
    mode "0644"
  end
end
