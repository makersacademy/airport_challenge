require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  describe 'Tests that need to call #land' do
    # before do
    #   allow(plane).to receive(:land)
    # end

    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport
    context "instruct a plane to land at an airport" do
      it "responds to #land" do
        allow(subject.weather).to receive(:weather_report) { "sunny" }
        expect(subject).to respond_to(:land).with(1).arguments
      end
    end

    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    # COMPONENTS -> 1. Plane must be in airport; #2. Plane can take off from airport;
    # 3. Confirm plane no longer in airport
    context "holds a plane in an airport once it has landed" do
      it "returns a plane when passed the #land method" do
        allow(subject.weather).to receive(:weather_report) { "sunny" }
        subject.land(plane)
        expect(subject.planes).to include(plane)
      end
    end

    context "instructs a plane to take off from an airport" do
      it "responds to #take_off method" do
        expect(subject).to respond_to(:take_off)
      end
    end

    context "confirms plane no longer in airport" do
      it "changes status to 'in the air' when plane has taken off" do
        allow(subject.weather).to receive(:weather_report) { "sunny" }
        subject.land(plane)
        subject.take_off(plane)
        expect(plane.status).to eq "In the air"
      end
    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full
    context "raises an error if the airport is full" do
      it "returns error when airport is at max capacity and another is added" do
        airport = Airport.new
        allow(airport.weather).to receive(:weather_report) { "sunny" }
        20.times { airport.land(Plane.new) }
        expect { airport.land(Plane.new) }.to raise_error "Airport is full, plane cannot be landed"
        ###THIS WAS THE ONLY SYNTAX THAT ALLOWED THIS TEST TO PASS, NO IDEA WHY!
      end
    end

    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate
    # COMPONENTS -> 1. Default capacity; 2. Possibility to override default capacity
    context "allows the user to define the capacity of the airport" do
      it "provides a default capacity of 20 for airport class objects" do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

      it "allows the capacity to be overriden" do
        airport = Airport.new(30)
        expect(airport.capacity).to eq 30
      end
    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent takeoff when weather is stormy
    # COMPONENTS -> (See weather_spec.rb for first 3 components)
    # 4. Prevent takeoff when stormy
    context "prevent takeoff/landing when stormy" do
      it "raises an error message when #take_off is executed and #weather_report is stormy" do
        allow(subject.weather).to receive(:weather_report) { "sunny" }
        subject.land(plane)
        allow(subject.weather).to receive(:weather_report) { "stormy" }
        expect { subject.take_off(plane) }.to raise_error "Stormy weather, plane cannot land or take off"
      end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when weather is stormy
      it "raises an error message when #land is executed and #weather_report is stormy" do
        allow(subject.weather).to receive(:weather_report) { "stormy" }
        expect { subject.land(plane) }.to raise_error "Stormy weather, plane cannot land or take off"
      end
    end
  end
end
