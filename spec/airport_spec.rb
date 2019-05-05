require './docs/airport'

describe "Airport" do
  airport = Airport.new

  it "Allows a plane to land" do
    expect(airport).to respond_to(:plane_land)
  end

  it "Allows a plane to take off" do
    expect(airport).to respond_to(:plane_takeoff)
  end

  it "Confirms a plane is no longer at airport after takeoff" do
    expect(airport.plane_takeoff).to eq("Plane no longer at airport")
  end
end
