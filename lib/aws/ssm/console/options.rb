require 'optparse'

module Aws
  module SSM
    module Console
      class Options
        attr_reader :instance_ids,
                    :command

        def initialize(argv)
          @instance_ids = []
          @command = nil

          parser.parse!(argv)
          validate!
        end

        private

        def parser
          @parser = OptionParser.new do |opt|
            opt.on('--instance-ids id,id,...', Array) { |v| @instance_ids += v }
            opt.on('-c command', String) { |v| @command = v }
            opt.on('--tag Name:Value', String) { |v| @instance_ids += collect_instance_ids_by_tag(v) }
          end
        end

        def validate!
          raise ArgumentError, 'EC2 instance IDs required.' if instance_ids.empty?
        end

        def collect_instance_ids_by_tag(tag)
          name, value = tag.split(':', 2)
          filters = [{ name: "tag:#{name}", values: [value] }]
          Aws::EC2::Client.new.describe_instances(filters: filters).reservations.each_with_object([]) do |reservation, res|
            reservation.instances.each { |instance| res << instance.instance_id }
          end
        end
      end
    end
  end
end
