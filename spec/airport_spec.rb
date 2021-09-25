require 'airport'

describe Airport do
  describe '#landing' do
    it { is_expected.to respond_to :land }
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe '#takeoff' do
    it { is_expected.to respond_to :takeoff }
    it { is_expected.to respond_to(:takeoff).with(1).argument }
  end
end
