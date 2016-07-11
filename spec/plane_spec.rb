require 'plane'
require 'airport'

describe Plane do
  subject(:plane) { Plane.new }
  subject(:airport) { Airport.new }

  describe 'it should be able to report where it is' do

    it 'landed' do
      airport.land(plane)
      expect(plane.location).to eq :airport
    end

  end

  describe 'take-off' do

    it 'taken-off' do
      allow(airport).to receive (:stormy?) {false}
      airport.land(plane)
      airport.take_off(plane)
      expect(plane.location).to eq :air
    end


  end
end
