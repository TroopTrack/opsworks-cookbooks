
execute "apt-get update" do
  command "apt-get update"
  ignore_failure true
  action :nothing
end

apt_repository "ffmpeg_ppa" do
  uri "http://ppa.launchpad.net/mc3man/trusty-media/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C300EE8C"
  notifies :run, "execute[apt-get update]", :immediately
end

package "ffmpeg" do
  action :install
  options '--force-yes'
end

