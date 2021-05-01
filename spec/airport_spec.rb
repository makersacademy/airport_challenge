require './lib/airport.rb'
#TODO need to refactor as 1 plane starting in every hangar by default
describe Airport do
  DEFAULT_CAPACITY = Airport::DEFAULT_CAPACITY
  describe '#land' do
    it 'responds to #land with 1 argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'stores a plane in the airport hangar' do
      # plane = Plane.new
      # subject.land(plane)
      plane = subject.hangar[0]
      expect(subject.hangar.include?(plane)).to eq(true)
    end
    it "prevents landing when #{DEFAULT_CAPACITY} planes in hangar" do
      #-1 because 1 plane starts in every hangar by default
      (DEFAULT_CAPACITY-1).times { 
        plane = Plane.new
        subject.hangar << plane
      }
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error 'Hangar is full!' 
    end
    it 'prevents landing if plane already landed' do
      plane = subject.hangar[0]
      expect { subject.land(plane) }.to raise_error 'Plane already landed!'
    end
  end
  describe '#take_off' do
    it 'responds to #take_off with 1 argument' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it 'removes the plane from the airport hangar' do
      plane = subject.hangar[0]
      subject.take_off(plane)
      expect(subject.hangar.include?(plane)).to eq(false)
    end
    it 'raises an error if plane not in airport' do
      plane = Plane.new
      expect { subject.take_off(plane) }.to raise_error 'Plane not found in airport!'
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