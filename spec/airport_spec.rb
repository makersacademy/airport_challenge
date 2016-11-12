require 'airport'
require 'plane'

describe Airport do

  it "should create a new object" do
    expect(subject).to be_a(Object)
  end

  it "should have a land method" do
    expect(subject).to respond_to(:land)
  end

  it "should land a plane" do
    expect(subject).to respond_to(:land).with(1).arguments
  end

  it "should contain a getter method for the number of planes" do
    expect(subject).to respond_to(:planes)
  end

  it "should save the planes inside a @planes instance variable" do
    plane1 = Plane.new
    airport = subject
    airport.land(plane1)
    expect(subject.planes.count).to eq 1
  end

  it "should land multiple planes" do
    plane1 = Plane.new
    plane2 = Plane.new
    airport = subject
    airport.land(plane1)
    airport.land(plane2)
    expect(subject.planes.count).to eq 2
  end

  it "should change the plane state to true once the plane has landed" do
    plane = Plane.new
    subject.land(plane)
    expect(plane.has_landed).to eq true
  end

  it "should contain a take_off method " do
    expect(subject).to respond_to(:take_off)
  end

  it "take_off method should receive a plane as argument" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

end
