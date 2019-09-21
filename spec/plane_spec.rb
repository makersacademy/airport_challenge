require "controller" # controller requires all the required files in one place

describe Plane do

  let(:plane) { described_class.new }
  airport = Airport.new

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  describe "#land" do

    context "when airport weather is sunny" do

      before(:each) do
        airport.weather = "sunny"
        plane.land(airport)
      end

      it "takes one argument (an airport to land at)" do
        expect(plane).to respond_to(:land).with(1).argument
      end

      # might be more relevant in airport_spec => Do this later
      # otherwise how to isolate the airport object?
      it "causes an airport to confirm the plane is there" do
        expect(airport.planes.include?(plane)).to eq true
      end

      it "confirms that the plane is not airborne" do
        expect(plane).not_to be_airborne
      end

    end # end of context: sunny

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when weather is stormy
    context "when airport weather is stormy" do

      before(:each) { airport.weather = "stormy" }

      it "raises an error" do
        expect { plane.land(airport) }.to raise_error "Cannot land due to stormy weather"
      end

      it "keeps the plane airborne" do
        expect(plane).to be_airborne
      end

      it "causes airport to not have the plane" do
        expect(airport.planes).not_to include plane
      end

    end # end of context: stormy

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full
    context "when airport is full" do

    end # end of context: airport full

  end # end of describe #land

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and
  # confirm that it is no longer in the airport
  describe "#take_off" do

    before(:each) do
      # because plane is airborne when instantiated, we need to land it first
      # to land it, the weather must first be sunny
      airport.weather = "sunny"
      plane.land(airport)
    end

    context "when airport weather is sunny" do

      before(:each) do
        airport.weather = "sunny"
        plane.take_off(airport)
      end

      it "takes one argument (an airport to take off from)" do
        expect(plane).to respond_to(:take_off).with(1).argument
      end

      it "confirms the plane is no longer in the airport" do
        expect(plane).to be_airborne
      end

    end # end of context: sunny

    # As an air traffic controller
    # To ensure safety
    # I want to prevent takeoff when weather is stormy
    context "when airport weather is stormy" do

      before(:each) do
        airport.weather = "stormy"
      end

      it "raises an error" do
        expect { plane.take_off(airport) }.to raise_error "Cannot take off due to stormy weather"
      end

      it "causes airport to ground the plane" do
        expect(airport.planes).to include plane
      end

      it "confirms plane is not airborne" do
        expect(plane).not_to be_airborne
      end

    end # end of context: stormy

  end # end of describe #take_off

end # end of describe Plane
