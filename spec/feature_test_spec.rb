require "./lib/airport"

describe "plane landing at the airport" do

  subject(:plane) {Plane.new}
  subject(:airport) {Airport.new}

  it "lands a plane at the airport and checks it has landed" do
  airport.land(plane)
  expect(plane.landed).to be false

  end
end