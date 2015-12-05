require 'capistrano/ec2_role_tag/aws_ec2_loader'

module Capistrano
  module Ec2RoleTag
    class AwsEc2RoleLoader
      def initialize(options = {})
        @provider = AwsEC2Loader.new(region: options[:region])
        @stage = options[:stage]
      end
      def fetch(role)
        @provider.fetch(stage: @stage, role: role)
      end
    end
  end
end
