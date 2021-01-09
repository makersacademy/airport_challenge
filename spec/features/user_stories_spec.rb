describe 'User Stories' do

  # I want to instruct a plane to land at an airport

  it 'instruct a plane to land at an airport' do
    airport = Airport.new
    plane = Plane.new
    expect {airport.land(plane)}.not_to raise_error
  end

  # I want to instruct a plane to take off from an airport

  it 'instruct a plane to take off from an airport' do
    airport = Airport.new
    plane = Plane.new
    expect {airport.take_off(plane)}.not_to raise_error
  end

end