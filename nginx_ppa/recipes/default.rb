# nginx-full and nginx-common conflict with upgraded nginx, remove them entirely first before installing nginx_ppa
package "nginx-common" do
  action :remove
end

package "nginx-full" do
  action :remove
end

execute "apt-get update" do
  command "apt-get update"
  ignore_failure true
  action :nothing
end

apt_repository "nginx_ppa" do
  uri "http://ppa.launchpad.net/nginx/development/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C300EE8C"
  notifies :run, "execute[apt-get update]", :immediately
end

package "nginx" do
  action :upgrade
  options '-o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'
end

include_recipe "nginx::service"

service "nginx" do
  action [ :enable, :start ]
end
