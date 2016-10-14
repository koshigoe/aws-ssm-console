require 'optparse'

module Aws
  module SSM
    module Console
      class Options
        attr_reader :instance_ids,
                    :command

        def initialize(argv)
          parser.parse!(argv)
          validate!
        end

        private

        def parser
          @parser = OptionParser.new do |opt|
            opt.on('--instance-ids id,id,...', Array) { |v| @instance_ids = v }
            opt.on('-c command', String) { |v| @command = v }
          end
        end

        def validate!
          raise ArgumentError, '--instance-ids is required' unless instance_ids
        end
      end
    end
  end
end
