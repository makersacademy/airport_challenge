require "airplane"
require "airport"

describe Airplane do
  it "allows for an airplane to be made" do
    expect(Airplane.new).to be_a(Airplane)
  end

  it "allows for the plane to land" do
    airbus = Airplane.new
    expect(airbus).to respond_to(:land_at)
  end

  it "allows for the plane to takeoff" do
    airbus = Airplane.new
    expect(airbus).to respond_to(:takeoff)
  end

  it "prevents plane from landing at a full airport" do
    airbus = Airplane.new
    gatwick = Airport.new
    gatwick.land_plane("1")
    expect{airbus.land_at("gatwick")}.to raise_error
  end
end
