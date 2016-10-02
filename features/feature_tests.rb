describe Airport do
#As an air traffic controller
#So I can get passengers to a destination
#I want to instruct a plane to land at an airport and confirm that it has landed
it 'airport can instruct plane to land at airport' do
  airport = Airport.new
  plane = Plane.new
  expect { airport.land(plane) }
end
end
