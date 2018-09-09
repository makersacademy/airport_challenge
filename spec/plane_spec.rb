require 'plane'
require 'airport'

describe Plane do
  let(:plane) { Plane.new }
  let(:weather) { double(:weather, :stormy? => false) }

  describe '#location' do
    it 'updates the airplane location on landing' do
      airport = Airport.new(Airport::CAPACITY, weather)
      airport.land(plane)
      expect(plane.location).to eq(airport.object_id)
    end

    it 'updates the airplane location on takeoff' do
      airport = Airport.new(Airport::CAPACITY, weather)
      airport.land(plane)
      airport.takeoff(plane)
      expect(plane.location).to eq('flying')
    end
  end
end
