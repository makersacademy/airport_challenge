require 'airport'

describe Airport do
  before(:each) do
    weather_double = double(:weather, :is_stormy? => false)
    @airport = Airport.new(Airport::DEFAULT_CAPACITY, weather_double)
    @plane = Plane.new(@airport)
  end

  # it "responds to is_full?" do # is_full? privately used by landing method
  #   expect(@airport).to respond_to(:is_full?)
  # end

  it "has a default capacity" do
    expect(@airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "default capacity can be overriden" do
    expect(Airport.new(15).capacity).to eq 15
  end

  # it "returns false if it has free spaces" do # is_full? privately used by landing method
  #   expect(@airport.is_full?).to be false
  # end

  it "gets a request from a landed plane to take-off, and allows it to take-off" do
    @airport.confirm_landing(@plane)
    expect(@airport.permission_to_take_off(@plane)).to be true
  end

  it "gets a request from a in-flight plane to land, and allows it to land" do
    @airport.confirm_landing(@plane)
    @airport.permission_to_take_off(@plane)
    expect(@airport.permission_to_land(@plane)).to be true
  end

  it "gets a request from a landed plane to land, and it raises a status error" do
    expect{@airport.permission_to_land(@plane)}.to raise_error("Invalid request")
  end

  it "gets a request from an in-flight plan to take off, and it raises a status error" do
    @airport.confirm_landing(@plane)
    @airport.permission_to_take_off(@plane)
    expect{@airport.permission_to_take_off(@plane)}.to raise_error("Invalid request")
  end

  it "gets a request from a landed flight in another airport to take-off, and raises an error" , :focus => true do
    london_airport = Airport.new(2, double(:weather, :is_stormy? => false))
    london_plane = Plane.new(london_airport)
    london_airport.confirm_landing(london_plane)
    new_york_airport = Airport.new(5, double(:weather, :is_stormy? => false))
    new_york_plane = Plane.new(new_york_airport)
    new_york_airport.confirm_landing(new_york_plane)
    expect {london_airport.permission_to_take_off(new_york_plane)}.to raise_error("Invalid request")
  end


  it "gets a confirmation of landing from plane" do
    @airport.confirm_landing(@plane)
    expect(@airport.planes.last).to eq @plane
  end

  it "gets a confirmation of take-off from plane" do
    @airport.confirm_take_off(@plane)
    expect(@airport.planes.count).to eq 0

  end

  it "gets request from a plane to land, and it doesn't allow it to land because it is at capacity" do
    (@airport.capacity).times {@airport.permission_to_land(Plane.new(@airport, "In-Flight"))}
    expect{@airport.permission_to_land(@plane)}.to raise_error("Airport at capacity")
  end

  it "doesn't allow any take offs from an empty airport" do
    ba_plane = Plane.new(@airport)
    sa_plane = Plane.new(@airport)
    @airport.confirm_landing(ba_plane)
    @airport.confirm_landing(sa_plane)
    @airport.permission_to_take_off(ba_plane)
    @airport.permission_to_take_off(sa_plane)
    expect{@airport.permission_to_take_off(@plane)}.to raise_error("Airport empty")

  end

end
