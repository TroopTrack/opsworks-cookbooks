
execute "apt-get update" do
  command "apt-get update"
  ignore_failure true
  action :nothing
end

repo_arch = node["kernel"]["machine"] == "x86_64" ? "amd64" : "i386"
repo_path = "node_#{node["nodejs"]["version"]}"

apt_repository "nodesource" do
  arch repo_arch
  uri "https://deb.nodesource.com/setup_14.x"
  distribution node["lsb"]["codename"]
  components ["main"]
  key "https://deb.nodesource.com/gpgkey/nodesource.gpg.key"
  notifies :run, "execute[apt-get update]", :immediately
end

package "nodejs" do
  action :upgrade
end
