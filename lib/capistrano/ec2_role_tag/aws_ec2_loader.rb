require 'aws-sdk'

module Capistrano
  module Ec2RoleTag
    class AwsEc2Loader
      def initialize(options = {})
        if options[:region].nil?
          @ec2 = AWS::EC2::Client.new(region: 'us-west-2')
        else
          @ec2 = AWS::EC2::Client.new(region: options[:region])
        end
      end
      def fetch(options = {})
        apps = @ec2.describe_instances(
          {filters: [
            {name: "tag:Stage", values: [options[:stage]]},
            {name: "tag:Role", values: [options[:role]]},
            {name: "state", values: ["running"]}
          ]})
        return [] if apps.reservations.empty?
        return [] if apps.reservations[0].instances.empty?
        return apps.reservations[0].instances.map{|instance| instance.private_dns_name }
      end
    end
  end
end
