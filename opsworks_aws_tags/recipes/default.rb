include_recipe "aws"

unless node['aws_tags'].nil? || node['aws_tags'].empty?
    aws_resource_tag node['ec2']['instance_id'] do
        tags(node['aws_tags'])
        action :update
    end
end
