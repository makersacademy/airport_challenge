describe "Airport Challenge" do

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport and confirm that it has landed

  describe "Planes can land at airports and confirm that they have landed" do
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

  describe "Planes can take off from airports and confirm that they have left the airport" do
    #GIVEN
    #WHEN
    #THEN
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy

  describe "Planes are prevented from taking off when the weather is stormy" do
    #GIVEN
    #WHEN
    #THEN
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy

  describe "Planes are prevented from landing when the weather is stormy" do
    #GIVEN
    #WHEN
    #THEN
  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate

  describe "Airports have a default capacity that can be overridden" do
    #GIVEN
    #WHEN
    #THEN
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full

  describe "Planes are prevented from landing when the airport is full" do
    #GIVEN
    #WHEN
    #THEN
  end
end