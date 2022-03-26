require './lib/plane'
require './lib/airport'

describe Plane do

  it "lands at the designated airport when instructed" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(airport.hangar).to include(plane)
    expect(plane.land(airport)).to eq plane
  end

  it "takes off when instructed if at an airport" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    plane.take_off
    expect(airport.hangar).not_to include(plane)
    expect(plane.take_off).to eq plane
  end

  it "lets air traffic controller know it can't take off if instructed to do so but not at airport" do
    plane = Plane.new
    expect { plane.take_off }.to raise_error("Already in the air")
  end

end
