require 'airport'

describe Airport do
  airport = Airport.new
  
  # As an air traffic controller 
  # So I can get passengers to a destination 
  # I want to instruct a plane to land at an airport
  it "allows landing of planes at the airport" do
    plane = double("Plane")
    allow(airport).to receive(:weather) { "sunny" }
    airport.plane_lands(plane)
    expect(airport.hanger).to include plane
  end

  # As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it "allows taking off from an airport" do
    plane = double("Plane")
    allow(airport).to receive(:weather) { "sunny" }
    airport.plane_lands(plane)
    airport.plane_takeoff(plane)
    expect(airport.hanger).to_not include plane
  end
  it "confirms back after plane taking off from an airport" do
    airport = Airport.new
    allow(airport).to receive(:weather) { "sunny" }
    plane = double("Plane")
    airport.plane_lands(plane)
    expect(airport.plane_takeoff(plane)).to eq "Plane took off"
  end

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when the airport is full
  it "prevents landing when airport is full" do
    airport = Airport.new
    allow(airport).to receive(:weather) { "sunny" }
    plane = double("Plane")
    plane2 = double("Plane")
    plane3 = double("Plane")
    airport.plane_lands(plane)
    airport.plane_lands(plane2)
    expect { airport.plane_lands(plane3) }.to raise_error "The hanger is full." 
  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate
  it "allows for a user chosen capacity" do
    airport = Airport.new(5)
    allow(airport.weather).to receive "sunny"
    plane = double("Plane")
    plane2 = double("Plane")
    plane3 = double("Plane")
    airport.plane_lands(plane)
    airport.plane_lands(plane2)
    expect { airport.plane_lands(plane3) }.not_to raise_error "The hanger is full." 
  end

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent takeoff when weather is stormy 

#   it "prevents takeoff when weather is stormy" do
#     airport = Airport.new
#     allow(airport.weather).to receive "sunny"
    
#     plane = double("Plane")
    
#     expect { airport.plane_lands(plane) }.not_to raise_error
#   end
end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 