require "airport"
require "plane"
# require "weather"

describe Airport do

  subject(:airport) { described_class.new }
  DEFAULT_CAPACITY = 30

  it "if stormy, plane does NOT take off" do
    plane = Plane.new
    # weather = Weather.new
    expect(airport.take_off(plane)).to eq ("The skies are dark, best to stay on the ground")
  end

  it "If stormy, plane does NOT land" do
    plane = Plane.new
    # weather = Weather.new
    expect(airport.land(plane)).to eq ("Got a storm front coming, cannot land here")
  end

  it "raises an error if terminal is full" do
    plane = Plane.new
    # weather = Weather.new
    Airport::DEFAULT_CAPACITY.times{ airport.land(plane) }
    expect { airport.land(plane) }.to raise_error ("Airport is full")
  end

  # it "raises an error concerning dock station being full with default capacity" do
  #   bike = Bike.new
  #   DockingStation::DEFAULT_CAPACITY.times{docking_station.dock(bike)}
  #   expect { docking_station.dock(bike) }.to raise_error("Dock is full")
  # end
end
