require 'airport'
require 'plane'
require 'weather'

describe Plane do

  it "should change its status to the airport when it lands" do
    fake_sunny = double(:weather, :stormy? => false)
    plane = Plane.new
    airport = Airport.new
    airport.land(plane, fake_sunny)
    expect(plane.status).to eq airport
  end
  it "should have an automatic status of 'air'" do
    plane = Plane.new
    expect(plane.status).to eq "air"
  end
end
