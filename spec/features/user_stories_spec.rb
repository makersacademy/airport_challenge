describe 'User Stories' do

  # I want to instruct a plane to land at an airport

  it 'instruct a plane to land at an airport' do
    airport = Airport.new(20)
    plane = Plane.new
    expect {airport.land(plane)}.not_to raise_error
  end

  # I want to instruct a plane to take off from an airport

  it 'instruct a plane to take off from an airport' do
    airport = Airport.new(20)
    plane = Plane.new
    expect {airport.take_off(plane)}.not_to raise_error
  end

  # I want to prevent landing when the airport is full 

  it 'prevents planes landing when airport is full' do
    airport = Airport.new(20)
    plane = Plane.new
    20.times {airport.land(plane)}
    expect { airport.land(plane) }.to raise_error "Cannot land plane - airport full"
  end

end