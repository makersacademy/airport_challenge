
require 'airport'

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
  end
end
