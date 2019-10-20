require 'airport'
require 'plane'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  context 'landing a plane' do

    it 'expects plane to be in airport' do
      airport.land(plane)
      expect(airport.landed_planes).to include(plane)
    end

  end

  context 'take off' do

    it 'expects plane to not be in airport' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.landed_planes).not_to include(plane)
    end

    it 'plane takes off' do
      expect(airport.takeoff(plane)).to eq("Plane safely taken off.")
    end
    
  end

end
