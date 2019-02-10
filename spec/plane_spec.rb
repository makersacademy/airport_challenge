require 'plane'
require 'airport'

describe Plane do
  it "starts off flying" do
    plane = Plane.new
    expect(plane.flying?).to eq(true)
  end

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

  it "is no longer flying after it has landed" do
    plane = Plane.new
    plane.land(Airport.new)
    expect(plane.flying?).to eq(false)
  end

  it "cannot land if it is already landed" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect { plane.land(airport) }.to raise_error("already landed")
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
