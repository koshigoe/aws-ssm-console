require 'spec_helper'

describe Aws::SSM::Console do
  describe '.client' do
    subject { described_class.client }

    it { is_expected.to be_an_instance_of(Aws::SSM::Client) }
  end
end
