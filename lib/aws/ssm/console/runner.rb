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
          stty_save = `stty -g`.chomp
          trap('INT') { system 'stty', stty_save; exit }

          loop do
            cmd = Readline.readline('>> ', true)
            break unless cmd
            command.invoke(cmd)
          end
        end
      end
    end
  end
end
