require "airport"
require "plane"

describe Airport do
  it { is_expected.to respond_to :land_plane }

  it 'lands a plane upon instruction' do
    airport = Airport.new
    plane = airport.land_plane
    expect(plane.plane_landed).to eq true
  end

  it 'instructs a plane to take off and confirms it is not longer in the airport' do

  end
end
