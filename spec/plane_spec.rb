require_relative '../lib/plane.rb'

describe Plane do

  describe 'status' do
    it { is_expected.to respond_to(:change_status) }
    it 'sets a default status value to flying when instantiated' do
      plane = Plane.new
      expect(plane.status).to eq 'Flying'
    end
    it 'changes value to landed when plane lands at an airport' do
      airport = Airport.new
      plane = Plane.new
      airport.land_plane(plane)
      expect(plane.status).to eq 'Landed'
    end
    it 'planes already landed cannot land' do
      airport = Airport.new
      plane = Plane.new
      airport.land_plane(plane)
      expect { airport.land_plane(plane) }.to raise_error('Plane already landed!')
    end
  end
end
