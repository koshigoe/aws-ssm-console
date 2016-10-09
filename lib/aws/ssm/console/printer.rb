module Aws
  module SSM
    module Console
      class Printer
        attr_reader :command, :command_id, :instance_ids

        def initialize(response)
          @command = response.command.parameters['commands'][0]
          @command_id = response.command.command_id
          @instance_ids = response.command.instance_ids
        end

        def print
          puts 'Running %{command}' % { command: command }

          wait do
            outputs do |instance_id, status, output|
              puts "[%{instance_id}] %<status>10s: %{command}\n%{output}" % { instance_id: instance_id, status: status, command: command, output: output}
            end
          end
        end

        private

        def wait(time: 1)
          loop do
            response = Aws::SSM::Console.client.list_command_invocations(command_id: command_id)
            break unless response.command_invocations.any? { |x| %w(Pending InProgress).include?(x.status) }
            sleep(time)
          end

          yield if block_given?
        end

        def outputs
          instance_ids.each do |instance_id|
            response = Aws::SSM::Console.client.list_command_invocations(command_id: command_id, instance_id: instance_id, details: true)
            response.command_invocations.each do |invocation|
              invocation.command_plugins.map do |command_plugin|
                yield(instance_id, command_plugin.status, command_plugin.output.split("\n").map { |x| "\t#{x}" }.join("\n"))
              end
            end
          end
        end
      end
    end
  end
end
