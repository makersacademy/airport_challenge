require 'airport'
require 'plane'
require 'weather'

describe Plane do

  it "should not be in an airport if flying" do
    plane = Plane.new
    # plane is in flight upon creation
    expect(plane.airport).not_to be_an_instance_of(Airport)
  end

  it "should be in an airport if landed" do
    plane = Plane.new
    airport = Airport.new
    allow(Weather).to receive(:stormy?).and_return(false)
    airport.land(plane)
    expect(plane.airport).to be_an_instance_of(Airport)
  end

end
