require "./lib/airport"

describe "FEATURE TEST" do

  subject(:plane) {Plane.new}
  subject(:airport) {Airport.new}
   it "lands a plane at the airport and checks it has landed" do
    allow(Weather).to receive(:weather?).and_return(false)

  airport.land(plane)
  expect(plane.landed).to be true

  end
end