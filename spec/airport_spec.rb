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
  plane = Plane.new
  airport.takeoff(plane)
  expect(airport).to respond_to(:takeoff)
end

it 'expects a plane to land at the airport and then be in the airport' do
  airport = Airport.new
  plane = Plane.new
  airport.land(plane)
  expect(airport.planes.include?(plane)).to eq(true)
end

it 'expects a plane to takeoff and no longer be at the airport' do
  airport = Airport.new
  plane = Plane.new
  airport.takeoff(plane)
  expect(airport.planes.include?(plane)).to eq(false)
end

it 'responds to the method full' do
  airport = Airport.new
  expect(airport).to respond_to(:full?)
end


end
