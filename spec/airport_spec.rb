require 'airport'

describe Airport do
  before(:each) do
    weather_double = double(:weather, :is_stormy? => false)
    @airport = Airport.new(Airport::DEFAULT_CAPACITY, weather_double)
    @plane = Plane.new(@airport)
  end

  it "responds to is_full?" do
    expect(@airport).to respond_to(:is_full?)
  end

  it "has a default capacity" do
    expect(@airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "default capacity can be overriden" do
    expect(Airport.new(15).capacity).to eq 15
  end

  it "returns false if it has free spaces" do
    expect(@airport.is_full?).to be false
  end

  it "gets a request from a plane to take-off, and allows it to take-off" do
    expect(@airport.permission_to_take_off(@plane)).to be true
  end

  it "gets a request from a plane to land, and allows it to land" do
    @airport.permission_to_take_off(@plane)
    expect(@airport.permission_to_land(@plane)).to be true
  end

  it "airport gets a confirmation of landing from plane" do
    @airport.confirm_landing(@plane)
    expect(@airport.planes.last).to eq @plane
  end

  it "gets request from a plane to land, and it doesn't allow it to land because it is at capacity" do
    @airport.capacity.times {@airport.confirm_landing(@plane)}
    expect{@airport.permission_to_land(@plane)}.to raise_error("Invalid request")
  end

  it "returns true if it has no free spaces left" do

  end
end
