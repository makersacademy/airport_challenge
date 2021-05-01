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
  end
end