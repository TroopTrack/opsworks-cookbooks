cron "clear_tmp" do
  hour "1"
  minute "0"
  command "find /tmp/ -maxdepth 1 -type f -cmin +10 -delete"
end
