describe 'user_stories' do 
  # As an air traffic controller 
  # So I can get passengers to a destination 
  # I want to instruct a plane to land at an airport
  it 'so planes can land, instruct plane to land' do
    airport = Airport.new(100)
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end

  # As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off from an airport 
  # and confirm that it is no longer in the airport
  it 'so planes takeoff, instruct plane to takeoff' do
    airport = Airport.new(100)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when the airport is full 
  it 'for safety, prevents planes landing when airport is full' do
    airport = Airport.new(100)
    plane = Plane.new
    100.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error 'Cannot land: airport full'
  end
end