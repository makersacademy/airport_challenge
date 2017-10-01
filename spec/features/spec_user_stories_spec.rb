describe 'FEATURE TEST: user stories' do
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport

  it 'so planes land at airports, instruct a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect{airport.instruct_plane_to_land(plane)}.not_to raise_error
  end

  it 'instructs a plane to land and holds it in the planes array' do
    airport = Airport.new
    plane = Plane.new
    expect{airport.instruct_plane_to_land(plane)}.to change{airport.plane_count}.by(1)
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it 'so planes take off from airports, instruct a plane to take off' do
  airport = Airport.new
  plane = Plane.new
  expect{ airport.instruct_plane_to_take_off(plane) }.not_to raise_error
  end

  it 'confirms that a plane is no longer in the airport' do
  plane = Plane.new
  airport = Airport.new
  airport.planes << plane
  expect{ airport.instruct_plane_to_take_off(plane)}.to change{airport.plane_count}.by(-1)
  end


end
