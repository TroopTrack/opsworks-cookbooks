

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
end

