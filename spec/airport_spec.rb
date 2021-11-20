require 'airport'
require 'plane'

describe Airport do

  it 'lands a plane at an airport' do
    plane = Plane.new
    airport = Airport.new("Heathrow")

    expect(airport.land(plane)).to eq plane
  end

  it 'confirms plane is no longer in the airport when plane takes off' do
    plane = Plane.new
    airport = Airport.new("Heathrow")

    airport.land(plane)

    expect(airport.take_off(plane)).to eq "sucessful take off of #{plane} from #{airport.name}"
  end

  it 'prevents landing a plane when the airport is full' do
    plane1 = Plane.new
    plane2 = Plane.new
    airport = Airport.new("Heathrow")

    airport.land(plane1)

    expect { airport.land(plane2) }.to raise_error("airport full: cannot land plane here") 
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
