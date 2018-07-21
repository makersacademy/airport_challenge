describe "Feature Test - user stories" do
  #user story 1
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport

  it "instruct a plane to land at an airport" do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end
  #user story 2
  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it "instruct a plane to take off from an airport" do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
    # expect { airport.take_off(plane) }.to raise("#{plane} has taken off")
  end




  #user story 5
  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full
  it "prevent landing when airport is full" do
    airport = Airport.new(20)
    plane = Plane.new
    20.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error 'cannot land plane, airport has reached capacity'
  end
end
