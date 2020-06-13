require './lib/plane'
# require './lib/airport.rb'
# require './lib/weather.rb'

describe Plane do
  let (:plane) {Plane.new}
  let (:airport) {Airport.new}
  # let (:weather) {Weather.new}

  describe '#land(airport)' do
    weather = Weather.new

    it 'Will land at an airport' do
      allow(airport).to receive(:weather_is_stormy?) { false }
      plane.land(airport)
      expect(airport.docking_bay).to include(plane)
    end

    it 'Will not land at an airport if the airport is full' do
      allow(airport).to receive(:weather_is_stormy?) { false } 
      plane.land(airport)
      expect { raise Plane.new.land(airport) }.to raise_error(RuntimeError)
    end

    it 'will not land at an airport if the weather is stormy' do
      allow(airport).to receive(:weather_is_stormy?) { true }
      expect { raise plane.land(airport) }.to raise_error(RuntimeError)
    end

  end

  describe '#takeoff' do
    it 'Will take off from an airport' do
      allow(airport).to receive(:weather_is_stormy?) { false }
      plane.land(airport)
      plane.takeoff
      expect(airport.docking_bay).not_to include(plane)
    end
  end

end