require 'plane'
require 'airport'

# This is the feature test for the first user story:

describe 'landing a plane at an airport' do
  it 'can land a plane at an airport' do 
    boeing = Plane.new
    expect(boeing.land('JFK')).to eq "landed"
  end
end

# This is the feature test for the second user story:

describe 'plane take off from an airport' do
  it 'plane can take off from an airport' do
    boeing = Plane.new
    
    expect(boeing.takeoff('JFK')).to eq 'flying'
  end
end

# This is the feature test for the third user story: 

describe 'prevent landing when the airport is full' do
  it 'plane is unable to land when airport is at capacity' do
    boeing = Plane.new
    heathrow = Airport.new
    heathrow.capacity(2)
    boeing.land('heathrow')
  end
end 

# This is the feature test for the third user story:

describe 'override a default airport capacity' do
  it 'overrides the default airport capacity' do
    heathrow = Airport.new
    heathrow.capacity(4) 
  end
end