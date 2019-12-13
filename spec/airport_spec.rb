require "airport"

describe Airport do
  it "allows for an airport to be made" do
    expect(Airport.new).to be_a(Airport)
  end

  it "allows for a plane to land" do
    gatwick = Airport.new
    expect(gatwick).to respond_to(:land_plane)
  end

  it "allows for a plane to takeoff" do
    gatwick = Airport.new
    expect(gatwick).to respond_to(:dispatch_plane)
  end
end
