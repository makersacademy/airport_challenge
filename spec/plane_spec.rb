require "plane"

describe Plane do
  
  it "should be able to land" do
    plane = Plane.new(true)
    expect(plane).to respond_to(:land)
  end

  it "should be able to take off" do
    plane = Plane.new(false)
    expect(plane).to respond_to(:take_off)
  end

  it "should not be in flight after landing" do
    plane = Plane.new(true)
    plane.land
    expect(plane.in_flight?).to eq false
  end

  it "should be in flight after take off" do
    plane = Plane.new(false)
    plane.take_off
    expect(plane.in_flight?).to eq true
  end

  it "should not be able to land more than once" do
    plane = Plane.new(false)
    expect { plane.land }.to raise_error("Plane already landed")
  end

  it "should not be able to take off more than once" do
    plane = Plane.new(true)
    expect { plane.take_off }.to raise_error("Plane already departed")
  end

end
