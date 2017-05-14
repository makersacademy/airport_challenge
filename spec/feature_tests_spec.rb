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
      airport.check_condition(weather)
      expect { airport.plane_takeoff }.to raise("Cannot take off when it's stormy")
    end
  end
end
