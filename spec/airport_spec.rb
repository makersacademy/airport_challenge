require "airport.rb"

describe Airport do

  it "should have a default capacity" do # <--user story 6 (needed to set default capacity to state airport is full and do user story 5)
    airport = Airport.new
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#land" do
  it "raises an error when attempting to land a plane in an airport of full capacity" do # <--user story 5
    subject.capacity.times { subject.land_in_airport Plane.new}
      expect { subject.land_in_airport Plane.new }.to raise_error "Airport is full"
    end
  end

  it "should not land the plane when an airport is full" do  # <--user story 5
    expect(subject).to respond_to(:full?)
  end

  it "should have a default capacity that can be reset" do # <--user story 6
    airport = Airport.new(250)
    expect(airport.airport_capacity(250)).to eq 250
  end

  describe "#weather?" do     # <--user story 3
  it "Should be able to set the weather" do
    if @weather_conditions == true
      expect(subject.weather?).to respond_to(:leave_airport)
      end
    end
  end

  it "raises an error when there is stormy weather, so that plane does not leave an airport" do # <--user story 3
    if @weather_conditions == false
      expect { subject.leave_airport Plane.new }.to raise_error "Due to stormy weather, plane cannot take off"
    end
  end
end
