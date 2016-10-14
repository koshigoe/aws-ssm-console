require 'spec_helper'

RSpec.describe Aws::SSM::Console::Options, type: :lib do
  describe '#new' do
    subject { described_class.new(argv) }

    describe '--instance-id' do
      context '--instance-id aaa,bbb' do
        let(:argv) { %w(--instance-id aaa,bbb) }

        it 'set instance_id' do
          expect(subject.instance_ids).to eq %w(aaa bbb)
        end
      end

      context '--instance-id' do
        let(:argv) { %w(--instance-id) }

        it 'raise ArgumentError' do
          expect { subject }.to raise_error(OptionParser::MissingArgument)
        end
      end

      context 'not specified' do
        let(:argv) { %w() }

        it 'raise ArgumentError' do
          expect { subject }.to raise_error(ArgumentError, '--instance-ids is required')
        end
      end
    end

    describe '-c' do
      context '-c ls' do
        let(:argv) { %w(--instance-ids aaa -c ls) }

        it 'set command_id' do
          expect(subject.command).to eq 'ls'
        end
      end

      context '-c' do
        let(:argv) { %w(--instance-ids aaa -c) }

        it 'set nil to command' do
          expect { subject }.to raise_error(OptionParser::MissingArgument)
        end
      end

      context 'not specified' do
        let(:argv) { %w(--instance-ids aaa) }

        it 'set nil to command' do
          expect(subject.command).to be_nil
        end
      end
    end
  end
end
