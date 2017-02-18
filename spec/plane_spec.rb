require 'plane'

describe Plane do

  it "should land at an airport" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(plane.airport).to eq airport
  end

  it "should confirm it's landed" do
    plane = Plane.new
    airport = Airport.new
    expect(plane.land(airport)).to eq true
  end

  it "should take off from an airport" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    plane.take_off(airport)
    expect(plane.airport).to eq nil
  end

  it "should confirm it took off" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(plane.take_off(airport)).to eq true
  end
  
end
