describe "User Stories" do
  #   As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport
  #and confirm that it is no longer in the airport
  it "so planes takeoff at airports, instruct a plane to takeoff" do
    airport = Airport.new
    plane = Plane.new
    airport.takeoff(plane)
  end
end
