require_relative '../spec/airport_spec.rb'
require_relative  '../lib/airport_challenge.rb'

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as 
# appropriate

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

describe Airport do
describe '#land' do
  it 'takes a plane and puts it in the hangar' do
    airport = Airport.new
    plane = 'BA123'
    airport.land(plane)
    expect(airport.hangar).to include 'BA123'
  end
end
end

describe '#land' do 
  it 'takes a plane and removes it from the hangar' do
    airport = Airport.new
    plane ='BA123'
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.hangar).not_to include plane
  end
end

describe '#Airport' && '#land' do
  it 'prevents a plane from landing when hangar is full' do
    airport = Airport.new
    plane = 'BA123'
    airport.land(plane)
      expect(plane).to receive(:full_hangar?).and_return(true)
      expect{airport.land}.to raise error 'Cannot land due to full hangar'
  end
end

describe '#Airport' && '#land' do
  it 'allows default airport_systems that can be overridden as appropriate for software users' do
    planes.count = default_capacity
    allow plane .to receive(:land)
    expect{'airport_systems'}.to be_overridden 'As appropriate for software users'
  end
end

describe 'takeoff' do
  it 'does not allow plane to take off' do
    allow(random_outlook).to receive(:stormy?).and_return(true)
    expect{subject.take_off}.to raise_error 'Cannot take off due to stormy weather'
  end
end

