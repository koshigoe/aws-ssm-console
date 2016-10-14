require 'spec_helper'

describe Aws::SSM::Console do
  it 'has a version number' do
    expect(Aws::SSM::Console::VERSION).not_to be nil
  end

  describe '.client' do
    subject { described_class.client }

    it { is_expected.to be_an_instance_of(Aws::SSM::Client) }
  end
end
