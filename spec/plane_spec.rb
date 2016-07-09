require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  context '#land' do

    it { is_expected.to respond_to(:land).with(1).arguments }
    it 'checks if plane has landed' do
      airport = AirPort.new
      expect(plane.land(airport)).to eq 'The plane has landed'

    end
  end

  context '#take_off' do

    it { is_expected.to respond_to(:take_off).with(1).arguments }
    it 'checks if plane has taken off' do
      airport = AirPort.new
      expect(plane.take_off(airport)).to eq 'The plane has taken off'

    end
  end

end
