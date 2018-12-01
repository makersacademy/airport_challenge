require "airport"

describe Airport do

  it "responds to the land method" do
    expect(subject).to respond_to :land
  end

  it "responds to the takeoff method" do
    expect(subject).to respond_to :takeoff
  end

  it "lands a plane when requested" do
    plane = Plane.new
    expect(subject.land(plane)).equal? plane  
  end

  it "takeoffs a plane" do
    plane = Plane.new
    expect(subject.takeoff(plane)).equal? plane
  end

  it "stores landed planes in hanger" do
    plane = Plane.new
    expect(subject.land(plane)).equal? plane
  end

  it "removes planes from hanger upon takeoff" do
    plane = Plane.new
    expect(subject.takeoff(plane)).equal? plane
  end

  it "removes specific plane requested from hanger upon takeoff" do
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    expect(subject.takeoff(plane2)).equal? plane2
  end

end

describe Plane do

end
