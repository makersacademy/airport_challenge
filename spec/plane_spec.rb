require './lib/plane'

describe Plane do
  let (:plane) {Plane.new}
  let (:plane2) {Plane.new}
  let (:airport) {Airport.new}

  describe '#land(airport)' do
    it 'Will land at an airport' do
      plane.land(airport)
      expect(airport.docking_bay).to include(plane)
    end

    it 'Will not land at an airport if the airport is full' do
      plane.land(airport)
      expect { raise plane2.land(airport) }.to raise_error(RuntimeError)
    end
  end

  describe '#takeoff' do
    it 'Will take off from an airport' do
      plane.land(airport)
      plane.takeoff
      expect(airport.docking_bay).not_to include(plane)
    end
  end

end