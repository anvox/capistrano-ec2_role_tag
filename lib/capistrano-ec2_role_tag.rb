require 'capistrano/ec2_role_tag/version'

module Capistrano
  module Ec2RoleTag
    class << self
      attr_accessor :provider, :stage
      def configure
        yield self
        self.stage = 'staging' if self.stage.nil?
        self.provider = AwsEC2RoleLoader.new(stage: self.stage)
      end
    end
    def ec2_by_role(role)
      Capistrano::Ec2RoleTag.provider.fetch(role)
    end
  end
end

extend Capistrano::Ec2RoleTag
