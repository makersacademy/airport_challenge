require 'airport'

describe Airport do

  it 'instructs plane to land at airport' do
    plane = Plane.new
    airport = Airport.new

    airport.land_plane(plane)

    expect(airport.print_planes).to include(plane)
  end

  it 'instructs plane to take off from airport' do
    plane = Plane.new
    airport = Airport.new

    airport.land_plane(plane)
    takeoff = airport.take_off_plane

    expect(airport.print_planes).to eq([])
    expect(airport.print_planes).not_to include(takeoff)
  end

  it 'prevents landing when airport is full' do
    airport = Airport.new
    10.times { airport.land_plane Plane.new }
    p airport.print_planes
    expect { airport.land_plane Plane.new }.to raise_error 'Airport is full'
  end

end
