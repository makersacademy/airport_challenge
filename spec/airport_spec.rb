require 'airport'
require 'plane'

describe Airport do
  it "can allow a plane to takeoff" do
    airport = Airport.new
    plane = Plane.new

    airport.land(plane) #land the plane before taking off
    airport.takeoff(plane)

    expect(airport.plane_count).to eq 0
  end

  it "can allow a plane to land" do
    airport = Airport.new
    plane = Plane.new

    airport.land(plane)
    expect(airport.plane_count).to eq 1
  end

  it "checks if plane capacity matches wirth default capacity" do
    airport = Airport.new

    expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
  end

end
