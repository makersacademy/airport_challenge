require 'plane'

# this is the feature test for the first user story:
#   As an air traffic controller 
#   So I can get passengers to a destination 
#   I want to instruct a plane to land at an airport

describe 'landing a plane at an airport' do
  it 'can land a plane at an airport' do 
    plane = Plane.new
    expect(plane.land('airport')).to eq 'airport'
  end
end

# boeing = Plane.new
# boeing.land("JFK")