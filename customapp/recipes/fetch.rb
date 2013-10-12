puts "DEBUG"
puts node

node[:deploy].each do |application, deploy|
  remote_file node[:deploy][:application][:custom][:binary_dest] do
    source node[:deploy][:application][:custom][:binary_url]
    mode "0755"
  end
end
