require 'airport'

describe Airport do

  describe '#land' do

    it 'lands a plane' do
      allow(subject).to receive(:rand).and_return(1)
      subject.land(Plane.new)
      expect(subject.planes).to_not be_empty
    end

    it 'cannot land same plane twice at the same airport' do
      allow(subject).to receive(:rand).and_return(1)
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'Plane already landed'
    end

    it 'cannot land same plane twice at different airport' do
      plane = Plane.new
      airport1 = Airport.new
      airport2 = Airport.new
      allow(airport1).to receive(:rand).and_return(1)
      allow(airport1).to receive(:rand).and_return(1)
      airport1.land(plane)
      expect { airport2.land(plane) }.to raise_error 'Plane already landed'
    end

    it 'does not land a plane if stormy' do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(2)
      airport.stormy?
      expect { airport.land(Plane.new) }.to raise_error "Weather is stormy"
    end

    it 'does not let a plane land if airport is full (default capacity)' do
      allow(subject).to receive(:rand).and_return(1)
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "Airport full"
    end

    it 'does not let a plane land if airport is full (50 capacity)' do
      airport = Airport.new(50)
      allow(airport).to receive(:rand).and_return(1)
      50.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error "Airport full"
    end

    it 'does not let a plane land if airport is full (changing capacity)' do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(1)
      airport.capacity = 50
      50.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error "Airport full"
    end

    it 'is not a Plane and therefore cannot be landed' do
      expect { subject.land("hey") }.to raise_error "Not a plane"
    end

  end

  describe '#take_off' do
    it 'allows a plane to take-off' do
      allow(subject).to receive(:rand).and_return(1)
      subject.land(Plane.new)
      subject.take_off
      expect(subject.planes).to be_empty
    end

    it 'take-off denined if stormy' do
      airport = Airport.new
      airport.land(Plane.new)
      allow(airport).to receive(:rand).and_return(2)
      airport.stormy?
      expect { airport.take_off }.to raise_error "Weather is stormy"
    end

    it 'notifies that there are no planes at the airport to take off' do
      allow(subject).to receive(:rand).and_return(1)
      expect { subject.take_off }.to raise_error "Airport empty"
    end

  end
end
