require 'plane'

# this is the feature test for the first user story:
#   As an air traffic controller 
#   So I can get passengers to a destination 
#   I want to instruct a plane to land at an airport

describe 'landing a plane at an airport' do
  it 'can land a plane at an airport' do 
    boeing = Plane.new
    expect(boeing.land('JFK')).to eq 'JFK'
  end
end


# This is the feature test for the second user story:
#   I want to instruct a plane to take off from an airport 
#   and confirm that it is no longer in the airport

describe 'plane take off from an airport' do
  it 'plane ca take off from an airport' do
    boeing = Plane.new
    expect(boeing.takeoff('JFK')).to eq 'JFK'
  end
end