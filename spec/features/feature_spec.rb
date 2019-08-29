require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe '#Feature tests' do
  describe 'Landing a plane at an airport', type: :feature do
    it 'Lands the plane' do
      plane = Plane.new
      airport = Airport.new
      weather = Weather.new
      while weather.stormy? == true do
        weather = Weather.new
      end
      expect(plane.land_at(airport, weather)).to eq "Plane has landed"
    end
  end
end
