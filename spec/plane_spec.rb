require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
  it { is_expected.to respond_to(:on_ground) }

  describe '#land' do
    it 'can land at airport' do
      expect(plane.land(Airport.new))
    end

    it 'confirms when lands' do
      plane.land(:airport)
      expect(plane.on_ground).to be true
    end
  end

  describe '#takeoff' do
    it 'can takeoff from airport to destination' do
      expect(plane.takeoff(Airport.new))
    end

    it 'confirms departure' do
      plane.takeoff(:destination)
      expect(plane.on_ground).to be false
    end
  end

end
