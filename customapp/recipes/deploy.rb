node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'other'
    Chef::Log.debug("Skipping customapp::deploy as application #{application} as it is not a custom app")
    next
  end

  include_recipe 'fetch'

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
      echo "$(date) Restarting" >> /tmp/worker-1.log
      nohup ./statsims >> /tmp/worker-1.log 2> /tmp/worker-1.err < /dev/null &
    EOH
  end
end