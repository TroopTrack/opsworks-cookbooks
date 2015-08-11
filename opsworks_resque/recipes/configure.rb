#
# cookbook name:: opsworks_resque
# recipe:: configure
#

if node[:opsworks][:instance][:hostname] == node['opsworks_resque']['admin_instance']
  node[:deploy].each do |application, deploy|
    Chef::Log.info("Configuring resque workers for application #{application}")

    template "Configure resque-worker" do
      path "/etc/init/resque-worker.conf"
      source "resque.conf.erb"
      owner "root"
      group "root"
      mode '0644'
    end

    settings = node[:opsworks_resque]

    settings[:workers].each do |queue, quantity|
      quantity.times do |idx|
        idx = idx + 1 # make index 1-based
        template "Configure resque-worker-#{idx}" do
          path "/etc/init/resque-worker-#{idx}.conf"
          source "resque-n.conf.erb"
          owner "root"
          group "root"
          mode '0644'
          variables queue: queue, instance: idx
        end
      end
    end

    service "resque-worker" do
      provider Chef::Provider::Service::Upstart
      supports stop: true, start: true
    end
  end
end
