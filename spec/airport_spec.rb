require 'airport'

describe Airport do
  
  it 'responds to the method land and lands a plane in the airport' do
    airport = Airport.new
    plane = Plane.new
    expect(airport).to respond_to :land
    expect(airport.land(plane)).to eq plane
  end

  it 'responds to the method take_off and returns a message that a plane has taken off' do
    airport = Airport.new
    expect(airport).to respond_to :take_off
    expect(airport.take_off).to eq "Plane has taken off."
  end

end

# 1. A plane needs to be able to land at an airport
# 2. A plane needs to be able to take off from an airport


