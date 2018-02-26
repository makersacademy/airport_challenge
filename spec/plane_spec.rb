require 'airport'
require 'plane'
require 'weather'

describe Plane do

  before(:each) do
    @fake_sunny = double(:weather, :stormy? => false)
    @fake_stormy = double(:weather, :stormy? => true)
  end

  it "should change its status to the airport when it lands" do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane, @fake_sunny)
    expect(plane.status).to eq airport
  end
  it "should have an automatic status of 'air'" do
    plane = Plane.new
    expect(plane.status).to eq "air"
  end
end
