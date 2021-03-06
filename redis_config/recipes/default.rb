node[:deploy].each do |app_name, deploy_config|
  # determine root folder of new app deployment
  if app_name == "trooptrack_web"
    app_root = "#{deploy_config[:deploy_to]}/shared"

    # use template 'resque.yml.erb' to generate 'config/redis.yml'
    template "#{app_root}/config/redis.yml" do
      source "redis.yml.erb"
      cookbook "redis_config"

      # set mode, group and owner of generated file
      mode "0660"
      group deploy_config[:group]
      owner deploy_config[:user]

      # define variable “@redis” to be used in the ERB template
      variables(
        :redis => deploy_config[:redis] || {}
      )

      action :create
    end
  end
end
