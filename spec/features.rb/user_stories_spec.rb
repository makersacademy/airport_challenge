describe 'all the user stories' do
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

it 'so plane lands ask plane to land' do
  airport = Airport.new()
  plane = Plane.new
  allow(airport).to receive(:stormy?).and_return false
  expect { airport.land(plane) }.not_to raise_error
  end


#   As an air traffic controller 
#   So I can get passengers on the way to their destination 
#   I want to instruct a plane to take off from an airport 
#   and confirm that it is no longer in the airport 
it 'so plane takes off' do
  airport = Airport.new()
  plane = Plane.new
  allow(airport).to receive(:stormy?).and_return false
  expect { airport.take_off(plane) }.not_to raise_error
end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

it 'do not allow planes to land when airport is full' do
  airport = Airport.new(15)
  plane = Plane.new
  allow(airport).to receive(:stormy?).and_return false
  15.times do
    airport.land(plane)
  end
  expect { airport.land(plane) }.to raise_error 'no landing space! airport full'
end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be 
# overridden as appropriate

it 'allows capacity to be overridden' do
  airport = Airport.new()
  plane = Plane.new
  expect { airport.default_capacity(plane) }
  end

#   As an air traffic controller 
#   To ensure safety 
#   I want to prevent takeoff when weather is stormy 

it 'prevents planes from taking off when weather is stormy' do
    airport = Airport.new()
    plane = Plane.new
  #   weather = stormy?
    allow(airport).to receive(:stormy?).and_return true 
    expect { airport.take_off(plane) }.to raise_error 'cannot take off if weather stormy'
end

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when weather is stormy 
it 'prevents planes from landimg when weather is stormy' do
  airport = Airport.new()
  plane = Plane.new
#   weather = stormy?
  allow(airport).to receive(:stormy?).and_return true 
  expect { airport.land(plane) }.to raise_error 'cannot land plane if weather stormy'
end

end
