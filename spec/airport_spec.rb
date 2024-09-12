require 'airport'
describe Airport do
  describe '#land' do
    it 'prevents landing when airport is full' do
      weather = double(:weather)
      airport = Airport.new(weather)
      allow(weather).to receive(:stormy?).and_return false
      Airport::DEFAULT_CAPACITY.times { airport.land Plane.new }
      expect { airport.land Plane.new }. to raise_error 'Airport full, do not land'
    end 
    it 'lands planes' do
      weather = double(:weather)
      airport = Airport.new(weather)
      allow(weather).to receive(:stormy?).and_return false
      plane = Plane.new
      expect(airport.land(plane)).to eq [plane]
    end 
    it 'prevents landing when weather is stormy' do
      weather = double(:weather)
      airport = Airport.new(weather)
      plane = Plane.new
      allow(weather).to receive(:stormy?).and_return true
      expect { airport.land(plane) }. to raise_error 'Stormy weather, do not land'
    end
  end 

  describe '#takeoff' do
    it 'allows planes to take off' do
      weather = double(:weather)
      airport = Airport.new(weather)
      allow(weather).to receive(:stormy?).and_return false 
      plane = Plane.new
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq plane
    end
    it 'prevents takeoff when weather is stormy' do
      weather = double(:weather)
      airport = Airport.new(weather)
      plane = Plane.new
      allow(weather).to receive(:stormy?).and_return true
      expect { airport.takeoff(plane) }. to raise_error 'Stormy weather, do not take off'
    end
  end 

  describe '#plane_status' do
    it 'confirms the plane is no longer in the airport' do
      weather = double(:weather)
      airport = Airport.new(weather)
      allow(weather).to receive(:stormy?).and_return false
      plane = Plane.new
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.plane_status(plane)).to be false
    end 

    it 'confirms the planes are in the airport' do
      weather = double(:weather)
      airport = Airport.new(weather)
      allow(weather).to receive(:stormy?).and_return false
      plane = Plane.new
      airport.land(plane)
      expect(airport.plane_status(plane)).to be true
    end 
  end
end 
