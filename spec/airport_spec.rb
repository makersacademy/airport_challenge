require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  describe 'landing planes' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe 'taking off planes' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
  end

end
