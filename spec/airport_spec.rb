require './lib/airport.rb'

describe Airport do
  DEFAULT_CAPACITY = Airport::DEFAULT_CAPACITY
  describe '#land' do
    it 'responds to #land with 1 argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'stores a plane in the airport hangar' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar.include?(plane)).to eq(true)
    end
    it "prevents landing when #{DEFAULT_CAPACITY} planes in hangar" do
      DEFAULT_CAPACITY.times { 
        plane = Plane.new
        subject.land(plane)
      }
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error 'Hangar is full!' 
    end
  end
  describe '#take_off' do
    it 'responds to #take_off with 1 argument' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it 'removes the plane from the airport hangar' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar.include?(plane)).to eq(false)
    end
    it 'raises an error if plane not in airport' do
      plane_one = Plane.new
      plane_two = Plane.new
      subject.land(plane_one)
      expect { subject.take_off(plane_two) }.to raise_error 'Plane not found in airport!'
    end
  end
  describe '#capacity' do
    it "has a default capacity of #{DEFAULT_CAPACITY}" do
      expect(subject.capacity).to eq(50)
    end
    it 'can override the default capacity' do
      airport = Airport.new(100)
      expect(airport.capacity).to eq(100)
    end
  end
end