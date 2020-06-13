require './lib/airport.rb'
# require './lib/plane.rb'
# require './lib/weather.rb'

describe Airport do
  let (:plane) { Plane.new }
  let (:airport) {Airport.new} 
  # let (:weather) {Weather.new}

  describe '#dock' do
    it 'is able to dock a plane' do
      allow(subject).to receive(:weather_is_stormy?) { false }
      subject.dock(plane)
      expect(subject.docking_bay).to include(plane)
    end

    it 'will not dock if the weather is stormy' do
      allow(subject).to receive(:weather_is_stormy?) { true }
      expect { raise subject.dock(plane) }.to raise_error(RuntimeError)
    end

    it 'will not dock if the docking bay is full' do
      allow(subject).to receive(:weather_is_stormy?) { false }
      subject.dock(Plane.new)
      expect { raise subject.dock(plane) }.to raise_error(RuntimeError)
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
      allow(big_airport).to receive(:weather_is_stormy?) { false }
      5.times { Plane.new.land(big_airport) }
      expect { raise Plane.new.land(big_airport) }.to raise_error(RuntimeError)
    end

    it 'will not land planes if the capacity is full' do
      big_airport = Airport.new(5)
      allow(big_airport).to receive(:weather_is_stormy?) { false }
      5.times { Plane.new.land(big_airport) }
      expect { raise Plane.new.land(big_airport) }.to raise_error(RuntimeError)
    end
 
  end

end