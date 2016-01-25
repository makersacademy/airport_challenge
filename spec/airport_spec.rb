require 'airport'

describe Airport do
	subject(:airport) { described_class.new }

		describe '.land_plane' do
  		it {is_expected.to respond_to(:land_plane).with(1).argument}

  		context 'when passed a plane' do
  			it 'adds a plane to the airport' do
  				plane = Plane.new
  				airport.land_plane(plane)
  				expect(airport.planes).to include(a_kind_of(Plane))
  			end
  		end
  	end
end