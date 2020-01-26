require 'airport'

describe Airport do
  plane = Plane.new
  
  context '#land(Plane)' do
    it 'runs' do
      expect(subject.land(plane)).to be
    end
    it 'raises error when airport is full' do
      airport = Airport.new
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error(RuntimeError, "Airport is full")
    end
  end

  context '#takeoff(Plane)' do
    it 'advises plane has left' do
      expect(subject.takeoff(plane)).to eq("#{plane} has left")
    end
  end
end