require 'airport'
require 'plane'

describe Airport do
  it "adds a plane to @planes" do
    plane = Plane.new
    airport = Airport.new
    airport.weather = 'sunny'
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end
  it "removes a plane from @planes" do
    plane = Plane.new
    airport = Airport.new
    airport.weather = 'sunny'
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to eq []
  end
  it "raises an error when the station is full" do
    expect {
      plane1 = Plane.new
      plane2 = Plane.new
      airport = Airport.new(1)
      airport.weather = 'sunny'
      airport.land(plane1)
      airport.land(plane2)
    }.to raise_error("The airport is full")
  end
  it "allows default capacity to be overridden" do
    expect(
      Airport.new(30).capacity
    ).to eq 30
  end
  it "raises an error when you try to take off a plane that isn't in that airport" do
    expect {
      plane = Plane.new
      airport = Airport.new
      airport.weather = 'sunny'
      airport.take_off(plane)
    }.to raise_error("This plane is not in this airport")
  end
  it "raises an error when you try to land a plane that is already in an airport" do
    expect {
      plane = Plane.new
      airport1 = Airport.new
      airport1.weather = 'sunny'
      airport2 = Airport.new
      airport2.weather = 'sunny'
      airport1.land(plane)
      airport2.land(plane)
    }.to raise_error("This plane is already landed")
  end
  it "raises an error when you try to land a plane when it is stormy" do
    expect {
      plane = Plane.new
      airport = Airport.new
      airport.weather = 'stormy'
      airport.land(plane)
    }.to raise_error("You can't land when it is stormy")
  end
  it "raises an error when you try to take off a plane when it is stormy" do
    expect {
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      airport.weather = 'stormy'
      airport.take_off(plane)
    }.to raise_error("You can't take off when it is stormy")
  end
end
