require './lib/airport.rb'

describe Airport do
  it 'expects airport to be an instance of airport class' do
  airport = Airport.new
  expect(airport).to be_instance_of(Airport)
end

it 'responds to the method land' do
  airport = Airport.new
  plane = Plane.new
  airport.land(plane)
  expect(airport).to respond_to(:land)
end

it 'responds to the method takeoff' do
  airport = Airport.new
  airport.takeoff
  expect(airport).to respond_to(:takeoff)
end
end
