require 'airport'
describe Airport do

  it 'instructs plane to land'do
  airport = Airport.new
  plane = Plane.new
  expect { airport.land(plane) }.not_to raise_error
end
it 'instructs plane to take_off'do
airport = Airport.new
plane = Plane.new
expect { airport.take_off(plane) }.not_to raise_error

end
end
