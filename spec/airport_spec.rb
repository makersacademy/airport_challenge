require 'airport'
require 'plane'
require 'weather'

RSpec.describe Airport do

  describe '#land' do
    it 'land a plane at an airport in good weather' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:weather_check) { true }
      airport.land(plane, weather)
      expect(airport.airport_array.length).to eq 1
    end

    it 'check the weather and if the weather is stormy, prevent landing' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:weather_check) { false }
      expect { airport.land(plane, weather) }.to raise_error("It is too stormy to land")
    end
  end

  describe '#take_off' do
    it 'a plane takes off from an airport in good weather and confirms it is no longer at the airport' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:weather_check) { true }
      airport.land(plane, weather)
      expect(airport.take_off(plane, weather)).to eq "The plane has successfully left the airport"
    end

    it 'check the weather and if the weather is stormy, prevent take off' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      airport.land(plane, weather)
      allow(weather).to receive(:weather_check) { false }
      expect { airport.take_off(plane, weather) }.to raise_error("It is too stormy to take off")
    end
  end

  describe "#full?" do
    it 'if an airport is full, you will not be able to land a plane there' do
      airport = Airport.new(0)
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:weather_check) { true }
      expect { airport.land(plane, weather) }.to raise_error("The airport is full")
    end
  end

end
