describe 'User stories' do

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport and confirm that it has landed

  it 'so planes land at airports, instruct a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane).not_to raise_error }
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it 'so planes take off from airports, instruct plane to take off' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.take_off(plane).not_to raise_error }
  end



  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy
  it 'does not allow planes to land when stormy' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.land(plane) }.to raise_error "Unable to land. Weather is stormy."
  end


end
