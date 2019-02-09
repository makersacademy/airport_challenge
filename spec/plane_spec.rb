require 'plane'
require 'airport'

describe Plane do
  it "can land" do
    plane = Plane.new
    expect(plane).to respond_to(:land)
  end

  it "knows which airport it has landed at" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(plane.airport).to eq(airport)
  end

  it "can take off from an airport it is in" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    plane.take_off(airport)
    expect(plane.airport).to eq(nil)
  end

  it "cannot take off from an airport it is not in" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect { plane.take_off(Airport.new) }.to raise_error("plane not at airport")
  end

  it "cannot take off if already flying" do
    plane = Plane.new
    expect { plane.take_off(Airport.new) }.to raise_error("already flying")
  end
end
