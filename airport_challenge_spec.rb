require "./lib/airport"
require "./lib/plane"

describe "Airport Challenge" do

  describe "Initialization" do
      it "Planes are not flying when created" do
      #GIVEN I have a new plane
      plane = Plane.new
      #WHEN I check the planes status
      #THEN The plane is not flying
      expect(plane.flying?).to eq false
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

  context "Land a flying plane and have it accepted by an airport" do
    it "Flying planes can land" do
      #GIVEN I have a plane that is flying
      plane = Plane.new
      plane.take_off
      #WHEN I tell the plane to land
      plane.land
      #THEN I expect the plane to not be flying
      expect(plane).not_to be_flying
    end
    it "Planes that are not flying cannot land" do
      #GIVEN I have a plane that is not flying
      plane = Plane.new
      #WHEN I try to land the plane
      #THEN I expect to get an error
      expect { plane.land }.to raise_error "This plane isn't flying!"
    end
    it "Airports can accept planes that are not flying" do
      #GIVEN I have an airport and a flying plane
      airport = Airport.new
      plane = Plane.new
      plane.take_off
      #WHEN I land the plane and ask the airport to accept it
      plane.land
      airport.accept plane
      #THEN I expect the plane to be stored in the airport
      expect(airport.planes).to include plane
    end
    it "Airports cannot accept planes that are still flying" do
      #GIVEN I have an airport and a flying plane
      airport = Airport.new
      plane = Plane.new
      plane.take_off
      #WHEN I ask the airport to accept the flying plane
      #THEN I expect an error
      expect { airport.accept plane }.to raise_error "Plane is still flying!"
    end
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  context "Have a plane take off and leave an airport" do
    it "Planes can take off" do
      #GIVEN I have a plane that is not flying
      plane = Plane.new
      #WHEN I tell the plane to take off
      plane.take_off
      #THEN I expect the plane to be flying
      expect(plane).to be_flying
    end
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy

  context "prevents planes from taking off when the weather is stormy" do
    #GIVEN
    #WHEN
    #THEN
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy

  context " prevents planes from landing when the weather is stormy" do
    #GIVEN
    #WHEN
    #THEN
  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate

  context "gives airports a default capacity that can be overridden" do
    #GIVEN
    #WHEN
    #THEN
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full

  context "prevents planes from landing at full airports" do
    #GIVEN
    #WHEN
    #THEN
  end
end