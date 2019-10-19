require 'airport'
require 'plane'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

describe 'air traffic controller' do
  it 'instructs a plane to land at an airport' do
    airport = Airport
    plane = Plane
    expect(plane.land).to eq("plane has landed")
  end
end
