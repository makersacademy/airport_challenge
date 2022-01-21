require 'airport'
require 'plane'

describe Airport do
  it "allows ATC to instruct a plane to land" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq("Plane landed at airport")
  end

  it "allows ATC to instruct a plane to take off" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.take_off(plane)).to eq("Plane has taken off")
  end

  it "prevents landing when the airport is full" do
    airport = Airport.new(0)
    plane = Plane.new
    expect { airport.land(plane) }.to raise_error
  end
end
