require 'aws-sdk'
require 'aws/ssm/console/version'
require 'aws/ssm/console/runner'
require 'aws/ssm/console/command'
require 'aws/ssm/console/printer'

module Aws
  module SSM
    module Console
      def self.client
        @client ||= Aws::SSM::Client.new
      end

      def self.run(instance_ids)
        Aws::SSM::Console::Runner.new(instance_ids).run
      end
    end
  end
end
