require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  describe '#land' do
    it 'should land a plane' do
      allow(subject).to receive(:weather) { "Sunny" }
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it 'should not land if airport is full' do
      allow(subject).to receive(:weather) { "Sunny" }
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Airport is full")
    end

    it 'should have a default capacity that can be overwritten' do
      airport = Airport.new(2)
      allow(airport).to receive(:weather) { "Sunny" }
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error("Airport is full")
    end

    it 'should prevent landing when weather is stormy' do
      allow(subject).to receive(:weather) { "Stormy" }
      expect { subject.land(plane) }.to raise_error("Bad weather")
    end
  end

  describe '#take_off' do
    it 'should make a plane take off' do
      allow(subject).to receive(:weather) { "Sunny" }
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'should prevent taking off when weather is stormy' do
      allow(subject).to receive(:weather) { "Stormy" }
      expect { subject.take_off(plane) }.to raise_error("Bad weather")
    end
  end

end
