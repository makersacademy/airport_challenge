require "airport.rb"

describe Airport do

  describe "#airport_capacity" do
      it "should have a default capacity" do # <--user story 6 (needed to set default capacity to state airport is full and do user story 5)
        airport = Airport.new
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

    it "should have a default capacity that can be reset" do # <--user story 6
      airport = Airport.new(250)
      expect(airport.airport_capacity(250)).to eq 250
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

  describe "#weather?" do
      it "should allow the plane to leave an airport if the weather is not stormy" do  # <--user story 3
        if @weather_conditions == "ok weather"
        expect(subject.weather?).to respond_to(:leave_airport)
    end
  end

      it "should instruct a plane that there is stormy weather, so that plane does not leave an airport" do # <--user story 3
        if @weather_conditions == "stormy"
        expect { subject.leave_airport Plane.new }.to raise_error "Due to stormy weather, plane cannot take off"
    end
  end

      it "should allow a plane to land if the weather is not stormy" do    # <--user story 4
        if @weather_conditions == "ok weather"
        expect(subject.weather?).to respond_to(:land_in_airport).with(1).argument
    end
  end

    it "should instruct a plane to not land in the airport if there is stormy weather conditions" do # <--user story 4
      if @weather_conditions == "stormy"
      expect { subject.land_in_airport Plane.new }.to raise_error "Due to stormy weather, plane cannot currently land in airport"
      end
    end
  end
end
