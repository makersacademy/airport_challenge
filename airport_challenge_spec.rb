require "./lib/airport"
require "./lib/plane"

describe "Airport Challenge - " do

  describe "Initialization - " do
      it "Planes are not at an airport when created" do
      #GIVEN I have a new plane
      plane = Plane.new
      #WHEN I check the planes status
      #THEN The plane is flying
      expect(plane.flying?).to eq true
    end
    it "Airports are empty when created" do
      #GIVEN I have a new airport
      airport = Airport.new
      #WHEN I check what planes the airport contains
      #THEN The airport is empty
      expect(airport.planes).to be_empty
    end
  end

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport and confirm that it has landed

  context "Landing a plane at an airport - " do
    it "Airports can accept planes" do
      #GIVEN I have an airport and a plane
      airport = Airport.new
      plane = Plane.new
      #WHEN I ask the airport to accept the plane
      airport.accept plane
      #THEN I expect the plane to be stored in the airport
      expect(airport.planes).to include plane
    end
    it "Planes stop flying when accepted by an airport" do
      #GIVEN I have an airport and a plane that is flying
      airport = Airport.new
      plane = Plane.new
      #WHEN I tell the airport to accept the plane
      airport.accept plane
      #THEN I expect the plane to not be flying
      expect(plane).not_to be_flying
    end
    it "Airports can only accept flying planes" do
      #GIVEN I have an airport and a plane that is not flying
      airport = Airport.new
      plane = Plane.new
      airport.accept plane
      #WHEN I ask the airport to accept the plane
      airport.accept plane
      #THEN I expect an error
      expect { airport.accept plane }.to raise_error "Plane is already at an airport"
    end
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  context "Having a plane leave an airport - " do
    it "Airports can release planes" do
      #GIVEN
      #WHEN
      #THEN
    end
    it "Planes start flying when released by an airport" do
      #GIVEN
      #WHEN
      #THEN
    end
    it "Airports can only release planes that they contain" do
      #GIVEN
      #WHEN
      #THEN
    end
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy

  context "Preventing planes leaving in stormy weather" do
    #GIVEN
    #WHEN
    #THEN
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy

  context "Preventing planes landing in stormy weather" do
    #GIVEN
    #WHEN
    #THEN
  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate

  context "Creating airports with different capacities" do
    #GIVEN
    #WHEN
    #THEN
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full

  context "Preventing planes from landing at full airports" do
    #GIVEN
    #WHEN
    #THEN
  end
end