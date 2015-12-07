require 'aws-sdk-v1'

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
            {name: "tag:Stage", values: [options[:stage].to_s]},
            {name: "tag:Role", values: [options[:role].to_s]},
            {name: "instance-state-name", values: ["running"]}
          ]})
        return [] if apps.reservation_set.empty?
        return [] if apps.reservation_set[0].instances_set.empty?
        return apps.reservation_set[0].instances_set.map{|instance| instance.private_dns_name }
      end
    end
  end
end
