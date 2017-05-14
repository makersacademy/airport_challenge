require './lib/airport'
require './lib/plane'
require './lib/weather'

airport = Airport.new
plane = Plane.new
weather = Weather.new

describe 'Feature Tests' do
  describe 'Landing' do
    it'ATC instructs a plane to land and gets a confirmation' do
      expect(airport.land(plane)).to eq "Plane has landed"
    end
  end
  describe 'Taking Off' do
    it'ATC instructs a plane to take off and gets a confirmation' do
      expect(airport.plane_takeoff).to eq "Plane has taken off"
    end
  end
  describe 'Prevent Taking off' do
    it'ATC prevents take offs when weather is stormy' do
      allow(airport).to receive(:bad_conditions?).and_return(true)
      expect { airport.plane_takeoff }.to raise_error(RuntimeError, "Cannot take off when it's stormy")
    end
  end
  describe 'Prevent Landing' do
    it'ATC prevents landing when weather is stormy' do
      allow(airport).to receive(:bad_conditions?).and_return(true)
      expect { airport.land(plane) }.to raise_error(RuntimeError, "Cannot land when it's stormy")
    end
    it'ATC prevents landing when the airport is full' do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error(RuntimeError, "Cannot land when airport is full")
    end
  end
  describe 'Change Capacity' do
    it'System Designer can change airport capacity' do
      airport.capacity = 30
      expect(airport.capacity).not_to eq Airport::DEFAULT_CAPACITY
    end
  end
end
