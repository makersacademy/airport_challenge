require 'airport'

describe Airport do
  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
  end

  it "it responds to is_full?" do
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

  it "gets request from a plane to land, and allows it to land" do
    expect(@airport.permission_to_land(@plane)).to eq true
  end

  it "gets request from a plane to land, and it doesn't allow it to land because it is at capacity"

  it "returns true if it has no free spaces left" do

  end
end
