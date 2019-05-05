require 'airport'

describe Airport do

describe '#land'
plane = Plane.new
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
  it 'should instruct plane to land at an airport' do
  subject.land(plane)
  expect(subject.planes).to include(plane)
end

# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport

describe '#takeoff'

it 'should instruct plane to takeoff from airport' do
  subject.takeoff
  expect(subject.planes).not_to include(plane)
end

end 
