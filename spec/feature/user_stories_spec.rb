describe 'User Stories' do
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
it 'so planes land at airport' do
  airport = Airport.new
  plane = Plane.new
  expect { airport.land(plane) }.not_to raise_error
  end

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to *take off* at an airport

it ' so planes take off from airport' do
  airport = Airport.new
  plane = Plane.new
  expect { airport.take_off(plane) }.not_to raise_error
end
end
