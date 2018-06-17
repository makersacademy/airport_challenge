require_relative '../lib/plane.rb'

describe Plane do
  airport = Airport.new
  plane = Plane.new

  describe 'status' do
    it 'sets a default status value to flying when instantiated' do
      expect(plane.status).to eq 'Flying'
    end
    it 'changes value to landed when plane lands at an airport' do
      airport.land_plane(plane)
      expect(plane.status).to eq 'Landed'
    end
    it 'planes already flying cannot take-off' do

    end
    it 'planes already landed cannot land' do

    end
    it 'planes can only take-off from an airport they are already in' do

    end
  end
end
