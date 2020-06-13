require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
  let (:plane) { Plane.new }
  let (:airport) {Airport.new} 
  let (:weather) {Weather.new}

  describe '#dock' do
    it 'is able to dock a plane' do
      subject.dock(plane)
      expect(subject.docking_bay).to include(plane)
    end
  end

  describe '#initialize' do
    it 'is created with a default capacity of 1' do
      plane.land(airport)
      expect { raise plane.land(airport) }.to raise_error(RuntimeError)
    end

    it 'can be created with a custom capacity' do
      big_airport = Airport.new(5)
      # allow(weather).to receive(:is_stormy?) { false }
      5.times { Plane.new.land(big_airport) }
      expect { raise Plane.new.land(big_airport) }.to raise_error(RuntimeError)
    end

    it 'will not land planes if the capacity is full' do
      #Need to add in a method stub to ensure that planes can always land
      big_airport = Airport.new(5)
      # allow(weather).to receive(:is_stormy?) { false }
      5.times { Plane.new.land(big_airport) }
      expect { raise Plane.new.land(big_airport) }.to raise_error(RuntimeError)
    end
 
  end

end