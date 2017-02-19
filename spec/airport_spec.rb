require 'airport'

describe Airport do
  before(:each) do
    weather_double = double(:weather, :is_stormy? => false)
    @airport = Airport.new("LHR", Airport::DEFAULT_CAPACITY, weather_double)
    @plane = Plane.new
  end

  let(:london_airport) {Airport.new("LHR", 2, double(:weather, :is_stormy? => false))}
  let(:london_plane) {Plane.new}
  let(:new_york_airport ) {Airport.new("EWR", 5, double(:weather, :is_stormy? => false))}
  let(:new_york_plane)  {Plane.new}

  it "has a default capacity" do
    expect(@airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "default capacity can be overriden" do
    expect(Airport.new("EWR",15).capacity).to eq 15
  end

  # it "returns false if it has free spaces" do # is_full? privately used by landing method
  #   expect(@airport.is_full?).to be false
  # end

  it "gets a request from a landed plane to take-off, and allows it to take-off", :focus => true do
    @airport.permission_to_land(@plane)
    expect(@airport.permission_to_take_off(@plane)).to be true
  end

  it "gets a request from a in-flight plane to land, and allows it to land" do
    @airport.permission_to_land(@plane)
    @airport.permission_to_take_off(@plane)
    expect(@airport.permission_to_land(@plane)).to be true
  end

  it "gets a request from a landed plane to land, and it raises a status error" do
    @airport.permission_to_land(@plane)
    expect{@airport.permission_to_land(@plane)}.to raise_error("Invalid request")
  end

  it "gets a request from an in-flight plan to take off, and it raises a status error" do
    @airport.permission_to_land(london_plane)
    @airport.permission_to_land(new_york_plane)
    @airport.permission_to_take_off(london_plane)
    expect{@airport.permission_to_take_off(london_plane)}.to raise_error("Invalid request")
  end

  it "gets a request from a landed flight in another airport to take-off, and raises an error" do
    london_airport.permission_to_land(london_plane)
    new_york_airport.permission_to_land(new_york_plane)
    expect {london_airport.permission_to_take_off(new_york_plane)}.to raise_error("Invalid request")
  end


  it "confirms a plane has landed and counts it in" do
    @airport.permission_to_land(@plane)
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
    @airport.permission_to_land(london_plane)
    @airport.permission_to_land(new_york_plane)
    @airport.permission_to_take_off(london_plane)
    @airport.permission_to_take_off(new_york_plane)
    expect{@airport.permission_to_take_off(@plane)}.to raise_error("Airport empty")
  end

  it "allows plan from another aiport to land and take off" do
    london_airport.permission_to_land(london_plane)
    new_york_airport.permission_to_land(new_york_plane)
    new_york_airport.permission_to_take_off(new_york_plane)
    london_airport.permission_to_land(new_york_plane)
    expect(new_york_plane.location).to eq london_airport.name
  end

end
