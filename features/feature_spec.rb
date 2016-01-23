require 'airport'
require 'plane'

#Feature 1: Want to instruct plane to land at airport and confirm that it has landed.

describe "landing" do
  it "planes can land at airport" do
    airport = Airport.new
    plane = Plane.new
    #Land the plane
    airport.land(plane)
    expect(plane.landed).to eq true
  end
end

#Feature 2: Want to instruct a plane to take-off from airport and confirm that it is no longer at airport.

describe "take off" do
  it "planes can take off from airport" do
    airport = Airport.new
    plane = Plane.new
    #plane takes off
    airport.land(plane)
    airport.take_off(plane)
    expect(plane.landed).to_not eq true
  end
end

#Edge Cases: Don't want a plane to be landed at more than one airport at once

describe "multiple airports" do
  it "can't be in two places at once" do
    airport_1 = Airport.new
    airport_2 = Airport.new
    plane = Plane.new
    airport_1.land(plane)
    expect { airport_2.land(plane) }.to raise_error "This plane is already landed at another airport."
  end
end
