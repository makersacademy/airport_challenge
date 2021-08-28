require 'plane'
describe Plane do

  context 'I want to instruct a plane to land at an airport' do
    let(:plane) { Plane.new true}

    it 'checks a plane exists' do
      expect(plane).to be_instance_of(Plane)
    end

  end

  context 'Checks that the plane is recorded as having left the airport' do
    
    let(:airport) { Airport.new }
    let(:plane) { Plane.new true}
    let(:flying_plane) { airport.take_off(plane) }

    it 'Checks if a plane is recorded as flying after takeoff' do
      expect(plane.flying).to eq true
    end

  end

end
