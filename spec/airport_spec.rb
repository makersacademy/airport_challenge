require './lib/airport.rb'
# require './lib/plane.rb'
# require './lib/weather.rb'

describe Airport do
  let (:plane) { Plane.new }
  let (:airport) {Airport.new} 
  # let (:weather) {Weather.new}

  describe '#dock' do
    it 'is able to dock a plane' do
      allow(airport).to receive(:weather_is_stormy?) { false }
      subject.dock(plane)
      expect(subject.docking_bay).to include(plane)
    end
  end

  describe '#initialize' do
    it 'is created with a default capacity of 1' do
      allow(airport).to receive(:weather_is_stormy?) { false }
      plane.land(airport)
      expect { raise Plane.new.land(airport) }.to raise_error(RuntimeError)
    end

    it 'can be created with a custom capacity' do
      big_airport = Airport.new(5)
      5.times { big_airport.docking_bay << Plane.new }
      allow(airport).to receive(:weather_is_stormy?) { false }
      expect { raise Plane.new.land(big_airport) }.to raise_error(RuntimeError)
    end

    it 'will not land planes if the capacity is full' do
      big_airport = Airport.new(5)
      allow(airport).to receive(:weather_is_stormy?) { false }
      5.times { big_airport.docking_bay << Plane.new }
      expect { raise Plane.new.land(big_airport) }.to raise_error(RuntimeError)
    end
 
  end

end