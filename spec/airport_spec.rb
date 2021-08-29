require 'airport'
require 'plane'

describe Airport do
  describe '#land' do
    it 'should land a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it 'should not land if airport is full' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Airport is full")
    end

    it 'should have a default capacity that can be overwritten' do
      airport = Airport.new(2)
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error("Airport is full")
    end
  end

  describe '#take_off' do
    it 'should make a plane take off' do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end

end
