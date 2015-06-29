cron "clear_tmp" do
  hour "3"
  minute "0"
  command "rm -rf /tmp/open-uri201*"
end
