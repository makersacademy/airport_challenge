require 'airport'
require 'plane'

describe Airport do
  it "adds a plane to @planes" do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end
  it "removes a plane from @planes" do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to eq []
  end
  it "raises an error when the station is full" do
    expect {
      plane1 = Plane.new
      plane2 = Plane.new
      airport = Airport.new
      airport.land(plane1)
      airport.land(plane2)
    }.to raise_error("The airport is full")
  end
end
