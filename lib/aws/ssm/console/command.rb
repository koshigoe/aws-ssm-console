module Aws
  module SSM
    module Console
      class Command
        attr_reader :start_timeout, :execution_timeout, :instance_ids

        DEFAULT_START_TIMEOUT = 30
        DEFAULT_EXECUTION_TIMEOUT = 3600

        def initialize(instance_ids:, start_timeout: DEFAULT_START_TIMEOUT, execution_timeout: DEFAULT_EXECUTION_TIMEOUT)
          @instance_ids = instance_ids
          @start_timeout = start_timeout
          @execution_timeout = execution_timeout
        end

        def invoke(command)
          response = Aws::SSM::Console.client.send_command(
            document_name: 'AWS-RunShellScript',
            instance_ids: instance_ids,
            timeout_seconds: start_timeout,
            parameters: {
              commands: [command],
              executionTimeout: [execution_timeout.to_s],
            }
          )
          Aws::SSM::Console::Printer.new(response).print
        rescue Aws::SSM::Errors::ServiceError
          # TODO: error handling
          raise
        end
      end
    end
  end
end
