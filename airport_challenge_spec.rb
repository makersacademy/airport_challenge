require "./lib/airport"
require "./lib/plane"

describe "Airport Challenge" do

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport and confirm that it has landed

  it "can land planes at airports and confirm that they have landed" do
    #GIVEN
    airport = Airport.new
    plane = Plane.new
    #WHEN
    plane.land
    airport.accept plane
    #THEN
    expect(plane).not_to be_flying
    expect(airport.planes).to include plane
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it "allows planes to take off from airports and confirm that they have left the airport" do
    #GIVEN
    #WHEN
    #THEN
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy

  it "prevents planes from taking off when the weather is stormy" do
    #GIVEN
    #WHEN
    #THEN
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy

  it " prevents planes from landing when the weather is stormy" do
    #GIVEN
    #WHEN
    #THEN
  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate

  it "gives airports a default capacity that can be overridden" do
    #GIVEN
    #WHEN
    #THEN
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full

  it "prevents planes from landing at full airports" do
    #GIVEN
    #WHEN
    #THEN
  end
end