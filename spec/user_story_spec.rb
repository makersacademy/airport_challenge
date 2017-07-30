describe 'User Stories' do
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport and confirm that it has landed
  it 'instructs plane to land at an airport' do
    airport = Airport.new
    plane = Plane.new
    expect {airport.land_plane(plane)}.not_to raise_error
  end

end
