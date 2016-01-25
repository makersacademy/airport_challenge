require "plane"

describe Plane do

  it "responds to the method flying" do
    expect(subject).to respond_to(:flying?)
  end

  it "should fly, when it is created" do
    plane = Plane.new
    expect(plane).to be_flying
  end

  it "responds to the method land" do
    expect(subject).to respond_to(:land)
  end

  it "should be able to land" do
    plane = Plane.new
    plane.land
    expect(plane).not_to be_flying
  end

  it "responds to the method take_off" do
    expect(subject).to respond_to(:take_off)
  end

  it "should be able to take_off" do
    plane = Plane.new
    plane.take_off
    expect(plane).to be_flying 
  end

end
