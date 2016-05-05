template "/etc/ImageMagick/policy.xml" do
  cookbook "imagemagick_policy"
  source "policy.xml.erb"
  owner "root"
  group "root"
  mode 0644
end
