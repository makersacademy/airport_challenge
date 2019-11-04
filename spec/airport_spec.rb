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

it 'raises an error if the airport is full and you try to land' do
airport = Airport.new
plane = Plane.new
plane2 = Plane.new
airport.land(plane2)
expect{airport.land(plane)}.to raise_error 'Airport is full'
end

it 'has a default capacity in this case set to 20' do
  airport = Airport.new
  expect(airport.capacity).to eq(20)
end


end
