# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

#require "./lib/aeroplane"
require "./lib/airport"

describe Airport do
  #   before(:each) do
  #     aeroplane = Aeroplane.new
  #     airport = Airport.new
  #   end

  it "can land a plane at the airport" do
    aeroplane = "aeroplane" #Aeroplane.new
    airport = Airport.new
    airport.land(aeroplane)
    expect(airport.landed).to include(aeroplane)
  end

  it "can instruct a plane to take off a plane" do
    aeroplane = "aeroplane" #Aeroplane.new
    airport = Airport.new
    weather = 2
    airport.land(aeroplane)
    airport.takeoff(aeroplane)
    expect(airport.landed).not_to include(aeroplane)
  end

  it "can prevent takeoff when weather is stormy " do
    aeroplane = "aeroplane" #Aeroplane.new
    airport = Airport.new
    airport.land(aeroplane)
    airport.weather = 1
    expect(airport.takeoff(aeroplane)).to eq("Stormy conditions, #{aeroplane} cannot take off")
  end
end
