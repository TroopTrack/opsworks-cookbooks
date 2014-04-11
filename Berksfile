source "http://api.berkshelf.com"

cookbook 'apt'
cookbook 'awscli', github: 'shlomoswidler/awscli'
cookbook 'postgresql'

# The original newrelic cookbook has dependencies on the iis cookbook, which is currently failing in our deployments
# due to an encoding issue.  We've removed them for now from our fork as unnecessary
cookbook 'newrelic', github: 'developertown/newrelic'

# The original repo is 'joeyAghion/opsworks_custom_env', but the metadata.rb isn't up-to-date to work with Berkshelf.
# The fork specified below has added that.  It would be good to go back to the original at some point if we can.
cookbook 'opsworks_custom_env', github: 'UndoConsulting/opsworks_custom_env'

cookbook 'mirthconnect', github: 'developertown/cookbook-mirthconnect'
cookbook 'openswan', github: 'developertown/cookbook-openswan'
