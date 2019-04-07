describe 'user stories' do

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
it 'Airport allows landing plane' do
  airport = Airport.new(20)
  plane = Plane.new
  expect { subject.land(plane) }.not_to raise_error
end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take
# off from an airport and confirm that it is no longer in the airport
it 'Airport allows planes to take off' do
  airport = Airport.new(20)
  plane = Plane.new
  expect { airport.take_off(plane) }.not_to raise_error
end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full
it 'Airport does not allow planes to land when full' do
  airport = Airport.new(20)
  plane = Plane.new
  20.times do
    airport.land(plane)
  end
  expect { airport.land(plane) }.to raise_error 'Plane unable to land, airport full'
 end
end
