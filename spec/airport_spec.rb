require "airport.rb"

describe Airport do

  describe "#airport_capacity" do
      it "should have a default capacity" do # <--user story 6 (needed to set default capacity to state airport is full and do user story 5)
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

    it "should have a default capacity that can be reset" do # <--user story 6
      airport = Airport.new(3)
      expect(airport.airport_capacity(3)).to eq 3
    end
  end

  describe "#land_in_airport" do
      it "raises an error when attempting to land a plane in an airport of full capacity" do # <--user story 5
        # allow(subject).to receive(:stormy?).and_return(false)
        airport = described_class.new(0, double(:weather, bad_weather?: false))
        puts subject.capacity
        expect { airport.land_in_airport Plane.new }.to raise_error "Airport is full"
      end
      it "raises an error when attempting to land a plane in an airport if it is stormy" do
        airport = described_class.new(1, double(:weather, bad_weather?: true))
        expect {airport.land_in_airport Plane.new }.to raise_error "Due to stormy weather, plane cannot currently land in airport"
      end
      it "should be able to check how many planes in airport" do
        airport = described_class.new(1, double(:weather, bad_weather?: false))
        airport.land_in_airport(:plane)
        expect(airport.planes).to eq [:plane]
      end
    end

    describe "#leave_airport" do
      it "raises an error when a plane is attempting to lean an airport with bad weather" do
        airport = described_class.new(1, double(:weather, bad_weather?: true))
        expect {airport.leave_airport }.to raise_error "Due to stormy weather, plane cannot take off"
      end
      it "plane should be able to leave the airport with good weather" do
        airport = described_class.new(1, double(:weather, bad_weather?: false))
        airport.land_in_airport(:plane)
        airport.leave_airport
        expect(airport.planes).to eq []
      end
    end
  end
