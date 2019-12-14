require 'airport'

describe Airport do

  describe '#initialize' do
    it 'initializes with an empty array' do
        expect(subject.hangar).to eq []
    end 
  end 

  describe '#capacity' do
    it 'has a capacity of 10' do
        expect(subject.capacity).to eq 10
    end

    it 'has a default capacity that can be overwritten as appropriate' do
        airport = Airport.new(Airport::DEFAULT_CAPACITY)
        expect(airport.capacity).to eq 20
    end 
  end 

  describe '#land' do
    it 'can land a plane at the airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it 'prevents a plane from landing when the airport is full' do
        plane = Plane.new
        Airport::CAPACITY.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error "Unable to land as the airport is at full capacity"
    end 
  end 

  describe '#take_off' do
    it 'allows a plane to take off and confirms that it is in the air' do
        plane = Plane.new
        expect(subject.take_off(plane)).to eq "Plane is airborne"
    end
  end 



end 