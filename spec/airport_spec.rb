require 'airport'
require 'plane'
# As an air traffic controller 
# So I can get passengers to a destination 
# I want (an airport) to instruct a plane to land at an airport

# As an air traffic controller 
# so planes can take off safely from my airport
# I would like to instruct a plane to take off and confirm it is no longer in the airport

# As an air traffic controller 
# to ensure safety
# i want to prevent landing when the airport is full

describe Airport do

  it 'instructs a plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off' do
    expect(subject).to respond_to(:takeoff).with(1).argument
  end 

  it 'gives an error when a plane tries to land when the airport is full' do
    expect { 21.times { subject.land(Plane.new) } }.to raise_error "Airport is full" 
  end
end