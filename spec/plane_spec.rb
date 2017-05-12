require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
  it { is_expected.to respond_to(:on_ground)}
  
  describe '#land' do
    it 'can land on airport' do
      expect(subject.land(Airport.new))
    end

    it 'confirms when lands' do
      subject.land(:airport)
      expect(subject.on_ground).to be true
    end
  end

  describe '#takeoff' do
    it 'can takeoff from airport to a destination' do
      expect(subject.takeoff(Airport.new))
    end

    it 'confirms departure' do
      subject.takeoff(:destination)
      expect(subject.on_ground).to be false
    end
  end
end