require './lib/airport'
require './lib/plane'

describe Airport do
  subject(:airport) { described_class.new(10) }

it 'Should land the plane at the airport' do
  expect(airport).to respond_to(:land).with(1).argument
end

it 'Instructs plane to take off from the airport' do 
  expect(airport).to respond_to(:take_off).with(1).argument
end

it 'Does not allow planes to land when the airport is full' do
  plane = double :plane
  10.times do 
    airport.land(plane)
  end 
  expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
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