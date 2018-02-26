require_relative '../lib/airport.rb'
require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'

describe Airport do

  describe '#create_plane' do
    it 'creates a plane object' do
      airport = Airport.new
      expect(airport.create_plane).to be_an_instance_of(Plane)
    end
  end

  describe '#plane_lands' do
    it 'accepts plane into airport' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.plane_lands(plane)).to include(plane)
    end
  end

  describe '#plane_takeoff' do
    it 'pops plane from airport' do
      airport = Airport.new
      expect(airport).to respond_to :plane_takeoff
    end
    it 'raises exception if weather is stormy' do
      airport = Airport.new
      # weather = Weather.new
      expect { airport.plane_takeoff }.to raise_error 'Plane grounded, weather is stormy'
    end
  end

  # describe '#bad_weather' do
  #   it 'does not let plane takeoff in bad weather' do
  #     airport = Airport.new
  #     weather = Weather.new
  #
  #   end
  # end

end
