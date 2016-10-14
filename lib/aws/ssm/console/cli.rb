module Aws
  module SSM
    module Console
      class CLI
        attr_reader :options

        def initialize(argv)
          @options = Options.new(argv)
        end

        def run
          runner = Aws::SSM::Console::Runner.new(options.instance_ids)
          if options.command
            runner.invoke(options.command)
          else
            runner.run
          end
        end
      end
    end
  end
end
