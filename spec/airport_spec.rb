require "airport"
require "plane"

describe Airport do

  it "should allow planes to land" do
    plane = Plane.new(true)
    airport = Airport.new(1)
    airport.land_plane(plane)
  end

  it "should allow planes to take off" do
    plane = Plane.new(true)
    airport = Airport.new(1)
    airport.land_plane(plane)
    airport.take_off_plane(plane)
    expect(plane.in_flight?).to eq true
  end

  it "should allow 1 plane to land" do
    plane = Plane.new(true)
    airport = Airport.new(1)
    airport.land_plane(plane)
    expect(airport.parked_planes_count).to eq 1
  end

  it "should allow 2 planes to land" do
    plane = Plane.new(true)
    plane_2 = Plane.new(true)
    airport = Airport.new(2)
    airport.land_plane(plane)
    airport.land_plane(plane_2)
    expect(airport.parked_planes_count).to eq 2
  end 

  it "should not allow a plane to land when airport is full" do
    airport = Airport.new(5)
    5.times { airport.land_plane(Plane.new(true)) }
    expect { airport.land_plane(Plane.new(true)) }.to raise_error("Airport is full")
  end

  it "should allow a landed plane to take off" do
    plane = Plane.new(true)
    airport = Airport.new(1)
    airport.land_plane(plane)
    airport.take_off_plane(plane)
  end

  it "should raise an error message if a plane that didn't land at this airport tries to take off" do
    plane = Plane.new(false)
    airport = Airport.new(1)
    expect { airport.take_off_plane(plane) }.to raise_error("Plane never landed here in the first place")
  end

  it "should keep track of the local weather" do
    airport = Airport.new(1)
    expect(airport).to respond_to(:weather)
  end
end
