require "airport"

describe Airport do

  it "responds to the land_plane method" do
  expect(subject).to respond_to :land_plane
  end

  it "responds to the takeoff method" do
    expect(subject).to respond_to :takeoff
    end

  it "lands a plane when requested" do
  plane = Plane.new
  expect(subject.land_plane(plane)).equal? plane  
  end

  it "takeoffs a plane" do
  plane = Plane.new
  expect(subject.takeoff(plane)).equal? plane
  end

end

describe Plane do

end