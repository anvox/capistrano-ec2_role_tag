require 'aws-sdk'

module Capistrano
  module Ec2RoleTag
    class AwsEc2Loader
      def initialize(options = {})
        if options[:region].nil?
          @ec2 = Aws::EC2::Client.new(region: 'us-west-2')
        else
          @ec2 = Aws::EC2::Client.new(region: options[:region])
        end
      end
      def fetch(options = {})
        apps = @ec2.describe_instances(
          {filters: [
            {name: "tag:Stage", values: [options[:stage].to_s]},
            {name: "tag:Role", values: [options[:role].to_s]},
            {name: "instance-state-name", values: ["running"]}
          ]})
        return [] if apps.reservations.empty?

        result = []
        apps.reservations.each do |reservation|
          next if reservation.instances.empty?
          result += reservation.instances.map {|instance| instance.private_dns_name }
        end

        return result
      end
    end
  end
end
