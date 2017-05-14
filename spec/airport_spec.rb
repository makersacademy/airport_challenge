require "airport.rb"

describe Airport do

  describe "#airport_capacity" do
      it "should have a default capacity" do # <--user story 6 (needed to set default capacity to state airport is full and do user story 5)
        airport = Airport.new
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

    it "should have a default capacity that can be reset" do # <--user story 6
      airport = Airport.new(3)
      expect(airport.airport_capacity(3)).to eq 3
    end
  end

  describe "#land_in_airport" do
      it "raises an error when attempting to land a plane in an airport of full capacity" do # <--user story 5
        subject.capacity.times { subject.land_in_airport Plane.new }
        expect { subject.land_in_airport Plane.new }.to raise_error "Airport is full"
      end
    end

  describe "#full?" do
      it "should not land the plane when an airport is full" do  # <--user story 5
      expect(subject).to respond_to(:full?)

    end
  end
end
