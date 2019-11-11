require 'airport'
require 'plane'
describe Airport do
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  it 'instructs plane to land' do
  airport = Airport.new(20)
  plane = Plane.new
   allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(plane) }.not_to raise_error
  end
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it 'instructs plane to take_off' do
  airport = Airport.new(20)
  plane = Plane.new
   allow(airport).to receive(:stormy?).and_return false
    expect { airport.take_off(plane) }.not_to raise_error
  end
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
  it 'does not allow plane to land when airport is full' do
  airport = Airport.new(20)
  plane = Plane.new
   allow(airport).to receive(:stormy?).and_return false
    20.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport is full'
   end
# As an air traffic controller
# To ensure safety
# I want to prevent takeoff and landing when weather is stormy
  it 'will not let a plane to take off when it is stormy' do
    airport = Airport.new(20)
    plane = Plane.new
   allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error 'Cannot land plane: too stormy'
  end
  it 'will not let a plane land when it is stormy' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
     expect { airport.land(plane) }.to raise_error 'Cannot land plane: too stormy'
  end
end
