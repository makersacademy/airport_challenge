require 'airport'

describe Airport do
  airport = Airport.new
  it 'instructs plane to land' do
	   expect(airport).to respond_to(:instruct_plane_to_land).with(1).argument
  end
end
