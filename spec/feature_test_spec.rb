require 'airport'
require 'plane'
require 'weather'

describe "#feature_test" do
  ###
  #As an air traffic controller
  #So I can get passengers to a destination
  #I want to instruct a plane to land at an airport and confirm
  #that it has landed
  it "Passes user story 1" do
    plane = Plane.new
    ap = Airport.new
    allow(ap).to receive(:weather_check).and_return(true)
    ap.land(plane)
    expect(plane.ground).to eq true
    expect(ap.planes).to eq [plane]
  end
  ###
  #As an air traffic controller
  #So I can get passengers on the way to their destination
  #I want to instruct a plane to take off from an airport and
  #confirm that it is no longer in the airport
  it "Passes user story 2" do
    plane = Plane.new
    ap = Airport.new
    allow(ap).to receive(:weather_check).and_return(true)
    ap.land(plane)
    expect(ap.planes).to eq [plane]
    ap.takeoff(plane)
    expect(ap.planes).to eq []
    expect(plane.ground).to eq false
  end
  ###
  #As an air traffic controller
  #To ensure safety
  #I want to prevent takeoff when weather is stormy
  it "Passes user story 3" do
    plane = Plane.new
    ap = Airport.new
    t_stormy = "Planes cannot take off due to stormy weather"
    allow(ap).to receive(:weather_check).and_return(true)
    ap.land(plane)
    expect(ap.planes).to eq [plane]
    allow(ap).to receive(:weather_check).and_raise(t_stormy)
    expect {ap.takeoff(plane)}.to raise_error(t_stormy)
  end
  ###
  #As an air traffic controller
  #To ensure safety
  #I want to prevent landing when weather is stormy
  it "Passes user story 4" do
    plane = Plane.new
    ap = Airport.new
    l_stormy = "Planes cannot land due to stormy weather"
    allow(ap).to receive(:weather_check).and_raise(l_stormy)
    expect {ap.land(plane)}.to raise_error(l_stormy)
  end
  ###
  #As an air traffic controller
  #To ensure safety
  #I want to prevent landing when the airport is full
  it "Passes user story 5" do
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    plane4 = Plane.new
    plane5 = Plane.new
    plane6 = Plane.new
    ap = Airport.new
    allow(ap).to receive(:weather_check).and_return(true)
    ap.land(plane1)
    ap.land(plane2)
    ap.land(plane3)
    ap.land(plane4)
    ap.land(plane5)
    expect {ap.land(plane6)}.to raise_error("The airport is full")
  end
  ###
  #As the system designer
  #So that the software can be used for many different airports
  #I would like a default airport capacity that can be overridden
  #as appropriate
  it "Passes user story 6" do
    ap = Airport.new(2)
    ap2 = Airport.new
    expect(ap.capacity).to eq(2)
    expect(ap2.capacity).to eq(5)
  end
end
