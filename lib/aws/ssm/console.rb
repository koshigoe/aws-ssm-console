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

      def self.run(instance_ids:, command: nil)
        runner = Aws::SSM::Console::Runner.new(instance_ids)
        if command
          runner.invoke(command)
        else
          runner.run
        end
      end
    end
  end
end
