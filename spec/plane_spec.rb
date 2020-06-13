require './lib/plane'

describe Plane do
  let (:plane) {Plane.new}
  let (:airport) {Airport.new}

  describe '#land(airport)' do
    it 'Will land at an airport' do
      plane.land(airport)
      expect(airport.docking_bay).to include(plane)
    end

    it 'Will not land at an airport if the airport is full' do
      plane.land(airport)
      expect { raise Plane.new.land(airport) }.to raise_error(RuntimeError)
    end

    # it 'will not land at an airport if the weather is stormy' do
    #   weather = Weather.new
    #   allow(weather).to receive(:is_stormy?) { true }
    #   expect { raise Plane.new.land(airport) }.to raise_error(RuntimeError)
    # end
  end

  describe '#takeoff' do
    it 'Will take off from an airport' do
      plane.land(airport)
      plane.takeoff
      expect(airport.docking_bay).not_to include(plane)
    end
  end

end