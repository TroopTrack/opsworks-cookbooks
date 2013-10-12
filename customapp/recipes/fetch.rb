node[:deploy].each do |application, deploy|
  remote_file deploy[:application][:custom][:binary_dest] do
    source deploy[:application][:custom][:binary_url]
    mode "0755"
  end
end
