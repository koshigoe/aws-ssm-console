require 'spec_helper'

RSpec.describe Aws::SSM::Console::CLI, type: :lib do
  describe '#new' do
    subject { described_class.new(%w(--instance-ids aaa)) }

    it 'set options' do
      expect(subject.options).to be_an_instance_of(Aws::SSM::Console::Options)
    end
  end

  describe '#run' do
    subject { described_class.new(argv).run }

    context 'without -c option' do
      let(:argv) { %w(--instance-ids aaa) }

      it 'delegate to Aws::SSM::Console::Runner#run' do
        expect_any_instance_of(Aws::SSM::Console::Runner).to receive(:run)
        subject
      end
    end

    context 'with -c option' do
      let(:argv) { %w(--instance-ids aaa -c ls) }

      it 'delegate to Aws::SSM::Console::Runner#invoke' do
        expect_any_instance_of(Aws::SSM::Console::Runner).to receive(:invoke).with('ls')
        subject
      end
    end
  end
end
