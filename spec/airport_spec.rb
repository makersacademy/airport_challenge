require './lib/airport'

describe Airport do

  it "check airport object" do
    expect{Airport.new}.to_not raise_error
  end

  it "check plane object" do
    expect{Plane.new}.to_not raise_error
  end

  it "check land a plane in the airport" do
    airport = Airport.new
    plane = Plane.new
    expect{airport.land(plane)}.to_not raise_error
  end

  it "raise error when no plane in airport" do
    plane = Plane.new
    expect{subject.takeoff}.to raise_error
  end

  it "check not allowed to land when airport is full" do
    Airport.new
    expect do
    DEFAULT_CAPACITY.times {subject.land Plane.new}
    end.to raise_error
  end

  it "not allowed to takeoff when stormy" do
  plane = Plane.new
  airport = Airport.new(30, "stormy")
  expect{Airport.takeoff}.to raise_error
  
  end

  it "not allowed to takeoff when stormy" do
    plane = Plane.new
    airport = Airport.new(30, "stormy")
    expect{Airport.land}.to raise_error
  end

end