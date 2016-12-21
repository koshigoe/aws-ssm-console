require 'aws-sdk'
require 'aws/ssm/console/cli'
require 'aws/ssm/console/options'
require 'aws/ssm/console/runner'
require 'aws/ssm/console/command'
require 'aws/ssm/console/printer'

module Aws
  module SSM
    module Console
      def self.client
        @client ||= Aws::SSM::Client.new
      end
    end
  end
end
