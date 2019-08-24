require './lib/airport'

describe Airport do
  class AirportSpy < Airport
    attr_reader :planes
  end

  subject { AirportSpy.new(1) }
  let(:plane) { double("Plane") }

  describe '#land' do
    it 'adds plane to planes array' do
      subject.land(plane)
      expect(subject.planes.first).to eq plane
    end

    it 'raises error if airport full' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error Airport::AirportFull
    end
  end

  describe '#landed?' do
    it 'is true for landed plane' do
      subject.land(plane)
      expect(subject.landed?(plane)).to eq true
    end

    it 'is false for non-existent plane' do
      expect(subject.landed?(plane)).to eq false
    end
  end

  describe '#take_off' do
    it 'raises error when taking off non-existent plane' do
      expect { subject.take_off(plane) }.to raise_error Airport::PlaneNotFound
    end

    it 'removes plane from planes array' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to be_empty
    end
  end
end