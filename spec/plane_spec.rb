require 'plane'
require 'airport'

describe Plane do
  subject(:plane) { Plane.new }
  subject(:airport) { Airport.new }

  describe 'landing the plane' do

    it 'knows it has landed' do
      airport.land(plane)
      expect(plane.location).to eq :airport
    end

  end

  describe 'take-off' do

    it 'knows it has taken-off' do
      airport.land(plane)
      airport.take_off(plane)
      expect(plane.location).to eq :air
    end


  end
end
