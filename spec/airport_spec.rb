require 'airport'
require 'plane'

describe Airport do

  it "should create a new object" do
    expect(subject).to be_a(Object)
  end

  it "should have a take method" do
    expect(subject).to respond_to(:take)
  end

  it "should take a plane" do
    expect(subject).to respond_to(:take).with(1).arguments
  end

  it "should contain a getter method for the number of planes" do
    expect(subject).to respond_to(:planes)
  end

  it "should save the planes inside a @planes instance variable" do
    plane1 = Plane.new
    airport = subject
    plane1.land(airport)
    expect(subject.planes.count).to eq 1
  end

  it "should take multiple planes" do
    plane1 = Plane.new
    plane2 = Plane.new
    airport = subject
    plane1.land(airport)
    plane2.land(airport)
    expect(subject.planes.count).to eq 2
  end

  it "should contain a release method " do
    expect(subject).to respond_to(:release)
  end

  it "release method should receive a plane as argument" do
    expect(subject).to respond_to(:release).with(1).argument
  end

  it "should allow a plane to take off" do
    plane = Plane.new
    plane.land(subject)
    expect(subject.release(plane)).to eq plane
  end

  it "should confirm a plane is no longer inside once it took off" do
    plane = Plane.new
    plane.land(subject)
    plane.take_off(subject)
    expect(subject.planes.count).to eq 0
  end


end
