require 'airport'
require 'plane'

describe Airport do
  it 'has a default capacity' do
    airport = Airport.new
    expect(airport.report_capacity).to eq 10
  end

  it 'prevents planes landing when the airport is full' do
    airport = Airport.new
    plane = Plane.new
    10.times { Plane.new.land(airport) }
    expect { plane.land(airport) }.to raise_error
  end
end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy

=begin
|Objects|Messages|
Passenger
Plane land take_off
Airport full? error if attempt to land while full capacity

Tests - Weather? Sunny/Stormy
=end
