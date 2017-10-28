require "airport"
require "plane"
# require "weather"

describe Airport do

  subject(:airport) { described_class.new }
  # DEFAULT_CAPACITY = 2

  it "if stormy, plane does NOT take off" do
    plane = Plane.new
    expect(airport.take_off(plane)).to eq ("The skies are dark, best to stay on the ground")
  end

  it "If stormy, plane does NOT land" do
    plane = Plane.new
    expect(airport.land(plane)).to eq ("Got a storm front coming, cannot land here")
  end

  it "raises an error if terminal is full" do
    plane = Plane.new
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    airport.land(plane)
    #Airport::DEFAULT_CAPACITY.times{ airport.land(plane) }
    p "HOW MANY planes have landed?", airport.land(plane)
    expect { airport.land(plane) }.to raise_error("Airport is full")
  end
end
