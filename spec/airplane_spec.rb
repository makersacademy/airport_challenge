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
    10.times { gatwick.land_plane(Airplane.new) }
    expect { airbus.land_at(gatwick) }.to raise_error
  end

  it "takesoff from an airport" do
    airbus = Airplane.new
    gatwick = Airport.new
    airbus.land_at(gatwick)
    airbus.takeoff
    expect(airbus.location).to eq "sky"
  end
end
