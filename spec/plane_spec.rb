require 'plane'
require 'airport'

describe Plane do
  context 'Instruct a plane to land at an airport' do
    it 'expects a plane class to exist' do
      plane = Plane.new true
      expect(plane).to be_instance_of(Plane)
    end

    it 'Checks if a plane is recorded as flying after takeoff' do
      plane = Plane.new true
      expect(plane.flying).to eq true
    end

  end
end
