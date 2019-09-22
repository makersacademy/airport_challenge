require 'airport'

describe Airport do

  describe '#land' do

    it 'responds to land' do
      expect(subject).to respond_to(:land).with(1).argument
      #check whether the airport class has a method called "land" that requires 1 argument
    end

    it 'lands a plane' do
      subject.land(Plane.new)
      expect(subject.planes).to_not be_empty
      #check whether the plane instance is stored once it has landed
    end

    it 'cannot land same plane twice at the same airport' do
      plane = Plane.new
      subject.land(plane)
      expect{ subject.land(plane) }.to raise_error('Plane already landed')
      #check whether the plane instance is stored once it has landed
    end

    it 'cannot land same plane twice at different airport' do
      plane = Plane.new
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.land(plane)
      expect{ airport2.land(plane) }.to raise_error('Plane already landed')
      #check whether the plane instance is stored once it has landed
    end

    it 'does not land a plane if stormy' do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(7)
      airport.stormy?
      expect{ airport.land(Plane.new) }.to raise_error ("Weather is stormy")
      #check weather is stormy before landing a plane
    end

    it 'does not let a plane land if airport is full (default capacity)' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Airport full")
    end

    it 'does not let a plane land if airport is full (50 capacity)' do
      airport = Airport.new(50)
      50.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error("Airport full")
    end
  end

  describe '#take_off' do
    it 'allows a plane to take-off' do
      subject.land(Plane.new)
      subject.take_off
      expect(subject.planes).to be_empty
      #check whether a plane is created when take off is called
    end

    it 'take-off denined if stormy' do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(7)
      airport.stormy?
      expect{ airport.take_off}.to raise_error ("Weather is stormy")
      #check whether a plane is created when take off is called
    end
  end
end
