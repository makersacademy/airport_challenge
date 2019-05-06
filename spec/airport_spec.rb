require 'airport'
require 'plane'
require 'weather'

airport = Airport.new
plane = Plane.new

describe Airport do
  it "lands a plane" do
    expect(airport.land(plane)).to eq(plane)
    expect(airport.contain?).to eq(plane)
  end
  it "takes off a plane" do
    expect(airport).to respond_to(:take_off)
    airport.take_off
    expect(airport.contain?).to eq(nil)
  end
end
