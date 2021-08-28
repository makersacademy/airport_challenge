require 'plane'
describe Plane do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new true }
  let(:flying_plane) { airport.take_off(plane) }

  context 'I want to instruct a plane to land at an airport' do

    it 'checks a plane exists' do
      expect(plane).to be_instance_of(Plane)
    end

    it 'Checks if a plane is recorded as not flying when landed' do
      airport.land_plane(plane)
      expect(airport.planes[0].flying).to eq false
    end
  end

  context 'Checks that the plane is recorded as having left the airport' do
    
    it 'Checks if a plane is recorded as flying after takeoff' do
      expect(plane.flying).to eq true
    end

  end

end
