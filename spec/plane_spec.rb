require './docs/plane'

describe Plane do

  it "Allows a new plane to be instructed to land" do
    airport = Airport.new
    plane = Plane.new
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "Allows a plane to be instructed to take off" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport).to respond_to(:takeoff).with(1).argument
  end

  it "Checks if the airport contains the plane after takeoff" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.status).not_to include(plane)
  end

  it "Only allows one plane to land" do
    airport = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new
    airport.land(plane1)
    expect { airport.land(plane2) }.to raise_error "Airport is full"
  end

end
