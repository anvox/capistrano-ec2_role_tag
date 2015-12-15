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

        result = []
        apps.reservation_set.each do |reservation|
          next if reservation.instances_set.empty?
          result += reservation.instances_set.map {|instance| instance.private_dns_name }
        end

        return result
      end
    end
  end
end
