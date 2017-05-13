require "airport.rb"

describe Airport do

  it "should have a default capacity" do
    airport = Airport.new
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "should have a default capacity that can be reset" do
    airport = Airport.new(250)
    expect(airport.airport_capacity(250)).to eq 250
  end

  describe "#land" do
  it "raises an error when attempting to land a plane in an airport of full capacity" do
    subject.capacity.times { subject.land Plane.new}
      expect { subject.land Plane.new }.to raise_error "Airport is full"
    end
  end

  it "should not land the plane when an airport is full" do
    expect(subject).to respond_to(:full?)
  end
end
