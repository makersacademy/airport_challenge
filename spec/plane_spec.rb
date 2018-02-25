require 'airport'
require 'plane'

describe Plane do
  it "should change its status to the airport when it lands" do
    plane = Plane.new
    airport = Airport.new
    airport.weather = 'sunny'
    airport.land(plane)
    expect(plane.status).to eq airport
  end
  it "should have an automatic status of 'air'" do
    plane = Plane.new
    expect(plane.status).to eq "air"
  end
end
