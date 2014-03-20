#
# Cookbook Name:: openswan
# Recipe:: default
#
# Copyright 2014, DeveloperTown, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


# Ensure Openswan is installed
package "openswan"

# Ensure kernel parameters are set properly
execute "Update Kernel Parameters for Openswan" do
  command "/sbin/sysctl -p /etc/ipsec.d/examples/sysctl.conf"
end


execute "Including entries from /etc/ipsec.d/*.conf" do
  command "echo \"include /etc/ipsec.d/*.conf\" >> /etc/ipsec.conf"

  not_if "grep \"^include /etc/ipsec.d/\*\.conf\" /etc/ipsec.conf"
end


node[:openswan][:peers].each do |peer|

  template "/etc/ipsec.d/#{peer[:name]}.conf" do
    source "site_connection.conf.erb"
    mode 0644
    owner "root"
    group "root"
    variables({
      :name =>peer[:name],
      :local_ip => node[:ipaddress],
      :elastic_ip => node[:openswan][:my_elastic_ip],
      :their_external_ip => peer[:their_external_ip],
      :their_inside_subnet => peer[:their_inside_subnet],
      :ike => peer[:ike],
      :ikelifetime => peer[:ikelifetime],
      :phase2alg => peer[:phase2alg],
      :salifetime => peer[:salifetime]
    })
  end

  service "ipsec" do
    subscribes :reload, "template[/etc/ipsec.d/#{peer[:name]}.conf]", :delayed
  end
end

