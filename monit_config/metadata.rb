name              "monit_config"

recipe "process", "Configure monit to monitoring a server process."
recipe "webgui", "Enable web GUI for monit service."

%w[ubuntu debian].each do |os|
  supports os
end

