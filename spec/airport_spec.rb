require "airport.rb"

describe Airport do

  it "should have a default capacity" do # <--user story 6 (needed to set default capacity to state airport is full and do user story 5)
    airport = Airport.new
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#land" do
  it "raises an error when attempting to land a plane in an airport of full capacity" do # <--user story 5
    subject.capacity.times { subject.land Plane.new}
      expect { subject.land Plane.new }.to raise_error "Airport is full"
    end
  end

  it "should not land the plane when an airport is full" do  # <--user story 5
    expect(subject).to respond_to(:full?)
  end

  it "should have a default capacity that can be reset" do # <--user story 6
    airport = Airport.new(250)
    expect(airport.airport_capacity(250)).to eq 250
  end
end
