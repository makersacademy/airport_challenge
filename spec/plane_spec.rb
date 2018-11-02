require 'plane'
require 'airport'

describe Plane do
  it "can be instructed to land at the airport" do
  plane = Plane.new
  expect(subject.land).to eq true
end

  it "can check that the plane is in the hanger after landing" do
  plane = Plane.new
  airport = Airport.new
  plane.land
  expect(airport.hangar.size).to eq 1
end
end
