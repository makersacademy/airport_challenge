require 'airport'

describe Airport do

  it { is_expected.to be_instance_of(Airport) }

  it 'can instruct a plane to land at the airport' do
    plane = Plane.new
    airport = Airport.new
    airport.land_plane(plane)
    expect(airport.planes).to eq(plane)
  end

end
