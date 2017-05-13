describe 'User Stories' do
  #As an air traffic controller
  #So I can get passengers to a destination
  #I want to instruct a plane to land at an airport and confirm that it has landed
  it "Allows ATC to instruct plane to land at airport" do
    airport = Airport.new(2)
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end

  #As an air traffic controller
  #So I can get passengers on the way to their destination
  #I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it "Allows ATC to instruct a plane to take off" do
    airport = Airport.new(2)
    plane = Plane.new
    expect { airport.takeoff(plane) }.not_to raise_error
  end

  #As an air traffic controller
  #To ensure safety
  #I want to prevent takeoff when weather is stormy

  it "So planes dont crash, airports have landing capacity" do
    airport = Airport.new(2)
    plane = Plane.new
    2.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error "Cannot land - Airport full!"
  end


end



#
#As an air traffic controller
#To ensure safety
#I want to prevent landing when weather is stormy

#As an air traffic controller
#To ensure safety
#I want to prevent landing when the airport is full

#As the system designer
#So that the software can be used for many different airports
#I would like a default airport capacity that can be overridden as appropriate
