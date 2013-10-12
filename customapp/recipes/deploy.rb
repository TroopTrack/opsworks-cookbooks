node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'other'
    Chef::Log.debug("Skipping customapp::deploy as application #{application} as it is not a custom app")
    next
  end

  puts "DEBUG:"
  puts deploy

  remote_file deploy[:custom][:binary_dest] do
    source deploy[:custom][:binary_url]
    mode "0755"
  end

  bash "stopping_statsims_processes" do
    user "deploy"
    cwd "/tmp"
    code <<-EOH
      pgrep -f statsims
      if [ "$?" == "0" ]; then
        echo "Killing existing statsims engine instance"
        pkill -f statsims
      fi
    EOH
  end

  bash "start_statsims_worker" do
    user "deploy"
    cwd "/tmp"
    code <<-EOH
      echo "$(date) Restarting" >> #{deploy[:custom][:logstdout]}
      #{deploy[:custom][:command]}
    EOH
  end
end
