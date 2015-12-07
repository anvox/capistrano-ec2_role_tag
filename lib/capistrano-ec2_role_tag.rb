require 'capistrano/ec2_role_tag/version'
require 'capistrano/ec2_role_tag/aws_ec2_role_loader'

module Capistrano
  module Ec2RoleTag
    class << self
      attr_accessor :provider, :stage
      def configure
        yield self
        #self.stage = 'test' #if self.stage.nil?
        puts "========================= Run on stage #{self.stage}"
        self.provider = Capistrano::Ec2RoleTag::AwsEc2RoleLoader.new(stage: self.stage)
      end
    end
  end
  class Configuration
    def ec2_by_role(role)
      if Capistrano::Ec2RoleTag.provider.nil?
        Capistrano::Ec2RoleTag.configure do |configure|
          configure.stage = fetch(:stage)
          puts "------------------------------ Configured"
        end
      end
      Capistrano::Ec2RoleTag.provider.fetch(role)
    end
  end
end

extend Capistrano::Ec2RoleTag
