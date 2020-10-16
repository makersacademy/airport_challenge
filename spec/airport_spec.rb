require 'airport'

RSpec.describe Airport do

  describe '#land' do
    airport = Airport.new
    plane = Plane.new
    weather = Weather.new
    it 'land a plane at an airport' do
      allow(weather).to receive(:weather_check) { true }
      airport.land(plane, weather)
      expect(airport.airport_array.length).to eq 1
    end
  end

  describe '#land' do
    airport = Airport.new
    plane = Plane.new
    weather = Weather.new
    it 'check the weather and if the weather is stormy, prevent landing' do
      allow(weather).to receive(:weather_check) { false }
      airport.land(plane, weather)
      expect { airport.take_off(plane, weather) }.to raise_error("It is too stormy to take off")
    end
  end

  describe '#take_off' do
    airport = Airport.new
    plane = Plane.new
    weather = Weather.new
    it 'a plane takes off from an airport and confirms it is no longer at the airport' do
      allow(weather).to receive(:weather_check) { true }
      airport.land(plane, weather)
      expect(airport.take_off(plane, weather)).to eq "The plane has successfully left the airport"
    end
  end

  describe '#take_off' do
    airport = Airport.new
    plane = Plane.new
    weather = Weather.new
    it 'check the weather and if the weather is stormy, prevent take off' do
      airport.land(plane, weather)
      allow(weather).to receive(:weather_check) { false }
      expect { airport.take_off(plane, weather) }.to raise_error("It is too stormy to take off")
    end
  end

  describe "#full?" do
    airport = Airport.new(0)
    plane = Plane.new
    weather = Weather.new
    it 'if an airport is full, you will not be able to land a plane there' do
      allow(weather).to receive(:weather_check) { true }
      expect { airport.land(plane, weather) }.to raise_error("The airport is full")
    end
  end
end
