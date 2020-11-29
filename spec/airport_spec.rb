require 'airport'
require 'plane'

describe Airport do

# As an air traffic controller 
# So I can get passengers to a destination 
# I want (an airport) to instruct a plane to land at an airport

  it 'instructs a plane to land' do
    allow(subject).to receive(:stormy?).and_return false
    expect(subject).to respond_to(:land).with(1).argument
  end

# As an air traffic controller 
# so planes can take off safely from my airport
# I would like to instruct a plane to take off and confirm it is no longer in the airport

  it 'instructs a plane to take off' do
    allow(subject).to receive(:stormy?).and_return false
    expect(subject).to respond_to(:takeoff).with(1).argument
  end 

# As an air traffic controller 
# to ensure safety
# i want to prevent landing when the airport is full

  it 'gives an error when a plane tries to land when the airport is full' do
    allow(subject).to receive(:stormy?).and_return false
    expect { 21.times { subject.land(Plane.new) } }.to raise_error "Airport is full" 
  end

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

  it 'does not allow planes to takeoff when weather is stormy' do
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.takeoff(Plane.new) }.to raise_error "It is too stormy to takeoff plane"
  end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

  it 'does not allow planes to land when weather is stormy' do
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.land(Plane.new) }.to raise_error "It is too stormy to land plane"
  end
end 
