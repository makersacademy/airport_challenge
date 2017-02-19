require 'airport'

describe Airport do
  before(:each) do
    @weather_double = double(:weather, :is_stormy? => false)
    # @airport = Airport.new("LHR", Airport::DEFAULT_CAPACITY, @weather_double)
    # @plane = Plane.new
  end
  let(:london_airport) {Airport.new("LHR", 2, @weather_double)}
  let(:london_plane) {Plane.new}
  let(:new_york_airport ) {Airport.new("EWR", 5, @weather_double)}
  let(:new_york_plane)  {Plane.new}

  it "has a default capacity" do
    expect(Airport.new("BHR").capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "default capacity can be overriden" do
    expect(Airport.new("EWR",15).capacity).to eq 15
  end


  it "gets a request from a landed plane to take-off, and allows it to take-off", :focus => true do
    london_airport.permission_to_land(london_plane)
    expect(london_airport.permission_to_take_off(london_plane)).to be true
  end

  it "confirms that a flight has taken off" do
    london_airport.permission_to_land(london_plane)
    london_airport.permission_to_take_off(london_plane)
    expect(london_plane.status).to eq "In-Flight"
    expect(london_airport.planes).to_not include(london_plane)
  end

  it "gets a request from a in-flight plane to land, and allows it to land" do
    london_airport.permission_to_land(london_plane)
    london_airport.permission_to_take_off(london_plane)
    expect(london_airport.permission_to_land(london_plane)).to eq true
  end

  it "confirms that a flight has landed" do
    london_airport.permission_to_land(london_plane)
    london_airport.permission_to_take_off(london_plane)
    london_airport.permission_to_land(london_plane)
    expect(london_plane.status).to eq "Landed"
    expect(london_airport.planes).to include(london_plane)
  end

  it "gets a request from a landed plane to land, and it raises a status error" do
    london_airport.permission_to_land(london_plane)
    expect{london_airport.permission_to_land(london_plane)}.to raise_error("Invalid request")
  end

  it "gets a request from an in-flight plan to take off, and it raises a status error" do
    london_airport.permission_to_land(london_plane)
    london_airport.permission_to_land(new_york_plane)
    london_airport.permission_to_take_off(london_plane)
    expect{london_airport.permission_to_take_off(london_plane)}.to raise_error("Invalid request")
  end

  it "gets a request from a landed flight in another airport to take-off, and raises an error" do
    london_airport.permission_to_land(london_plane)
    new_york_airport.permission_to_land(new_york_plane)
    expect {london_airport.permission_to_take_off(new_york_plane)}.to raise_error("Invalid request")
  end

  it "gets request from a plane to land, and it doesn't allow it to land because it is at capacity" do
    (london_airport.capacity).times {london_airport.permission_to_land(Plane.new)}
    expect{london_airport.permission_to_land(london_plane)}.to raise_error("Airport at capacity")
  end

  it "doesn't allow any take offs from an empty airport" do
    london_airport.permission_to_land(london_plane)
    london_airport.permission_to_land(new_york_plane)
    london_airport.permission_to_take_off(london_plane)
    london_airport.permission_to_take_off(new_york_plane)
    expect{london_airport.permission_to_take_off(Plane.new)}.to raise_error("Airport empty")
  end

  it "allows plan from another aiport to land and take off" do
    london_airport.permission_to_land(london_plane)
    new_york_airport.permission_to_land(new_york_plane)
    new_york_airport.permission_to_take_off(new_york_plane)
    london_airport.permission_to_land(new_york_plane)
    expect(new_york_plane.location).to eq london_airport.name
  end

  it "Planes count increase after a successful landing" do
    london_airport.permission_to_land(london_plane)
    expect(london_airport.planes.count).to eq 1
  end

  it "Planes count decrease after a successful take_off" do
    london_airport.permission_to_land(london_plane)
    london_airport.permission_to_take_off(london_plane)
    expect(london_airport.planes.count).to eq 0
  end

end
