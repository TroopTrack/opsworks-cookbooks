#
# Cookbook Name:: monit_config
# Recipe:: webgui
#

if node[:opsworks][:instance][:hostname] == "backoffice-app1"
  template "/etc/monit/monitrc" do
    source "monitrc.erb"
    mode 0600
    owner "root"
    group "root"
    variables(
      :username => node[:monit_config][:webgui][:username],
      :password => node[:monit_config][:webgui][:password]
    )
    action :create
  end

  execute "build_monit_pem_certificate" do
    command "cat /etc/nginx/ssl/#{node[:monit_process][:stack_firstly_added_domain]}.key > /etc/monit/monit.pem && cat /etc/nginx/ssl/#{node[:monit_process][:stack_firstly_added_domain]}.crt >> /etc/monit/monit.pem && chmod 600 /etc/monit/monit.pem"
    user "root"
    group "root"
  end

  service 'monit' do
    action :restart
  end
end
