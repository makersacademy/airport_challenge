require './lib/airport'
require './lib/plane'

describe Airport do

it 'Should land the plane at the airport' do
  airport = Airport.new
  plane = Plane.new
  expect(airport).to respond_to(:land).with(1).argument
end

 # possible for a plane to take off from airport
it 'Instructs plane to take off from the airport' do 
  airport = Airport.new
  plane = Plane.new
  expect(airport).to respond_to(:take_off).with(1).argument
end

# it 'Should return true when the airport is full' do 
#   airport = Airport.new
#   plane = Plane.new 
#   expect(airport).to respond_to(:full?)
#   expect(airport.full?).to eq(true)
# end 

# it 'Has a default capacity' do
# end

# it 'Prevents takeoff when weather is stormy' do 
# end 

# it 'Prevents landing when weather is stormy' do
# end 

end 