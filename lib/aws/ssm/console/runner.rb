require 'readline'

module Aws
  module SSM
    module Console
      class Runner
        attr_reader :command

        def initialize(instance_ids)
          @command = Aws::SSM::Console::Command.new(instance_ids: instance_ids)
        end

        def run
          loop do
            command.invoke(Readline.readline('>> ', true))
          end
        end
      end
    end
  end
end
