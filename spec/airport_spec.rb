require 'airport'

describe Airport do
  plane = Plane.new
  
  context '#land(Plane)' do
    it 'runs' do
      expect(subject.land(plane)).to be
    end
    it 'raises error when airport is full' do
      Airport::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error(RuntimeError, "Airport is full")
    end
    it 'raises error when stormy' do
      # subject.stormy = true
      expect { subject.land(plane) }.to raise_error(RuntimeError, "Weather is stormy")
    end
  end

  context '#takeoff(Plane)' do
    it 'advises plane has left' do
      expect(subject.takeoff(plane)).to eq("#{plane} has left")
    end
    it 'raises error when stormy' do
      # subject.stormy = true
      expect { subject.takeoff(plane) }.to raise_error(RuntimeError, "Weather is stormy")
    end
  end

  context ':capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'can be instantiated with a different capacity' do
      airport = Airport.new(5)
      expect(airport.capacity).to eq(5)
    end
    it 'can be changed after instantiation' do
      airport = Airport.new
      airport.capacity = 5
      expect(airport.capacity).to eq(5)
    end
  end
end