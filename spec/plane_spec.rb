require 'plane'
require 'airport'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  context 'land plane' do

    it 'updates plane flying status' do
      airport.land(plane)
      expect(plane.flying).to eq false
    end

  end

end
