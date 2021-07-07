require 'airport'
require 'plane'
require 'weather'

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
      allow(subject).to receive(:stormy?).and_return false
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it 'prevents a plane from landing when the airport is full' do
      allow(subject).to receive(:stormy?).and_return false 
      plane = Plane.new
      Airport::CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Unable to land as the airport is at full capacity"
    end 

    it 'prevents a plane from landing when the weather is stormy' do
      allow(subject).to receive(:stormy?).and_return true # sets weather to stormy
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error "Unable to land due to stormy weather conditions"
    end 

    it 'prevents a plane from landing if the plane has already landed' do
      allow(subject).to receive(:stormy?).and_return false
      plane = Plane.new
      subject.land(plane)
      plane.grounded = true
      expect { subject.land(plane) }.to raise_error "Plane has already landed" 
    end
  end 

  describe '#take_off' do
    it 'allows a plane to take off and confirms that it is in the air' do
      allow(subject).to receive(:stormy?).and_return false
      plane = Plane.new
      expect(subject.take_off(plane)).to eq "Plane is airborne"
    end

    it 'prevents a plane from taking off if the weather is stormy' do
      allow(subject).to receive(:stormy?).and_return true # setting weather to stormy
      plane = Plane.new
      expect { subject.take_off(plane) }.to raise_error "Plane is unable to take off due to stormy weather conditions"
    end 

    it 'a plane that has taken off cannot take off again' do
      allow(subject).to receive(:stormy?).and_return false
      plane = Plane.new
      subject.take_off(plane)
      plane.airborne = true
      expect { subject.take_off(plane) }.to raise_error "Plane has already taken off!"
    end 
  end 
end