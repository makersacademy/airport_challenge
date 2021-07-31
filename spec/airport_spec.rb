require 'airport'
require 'plane'

describe Airport do

  # test 1
  it "responds to plane take off method" do
    expect(Airport.new(Plane.new)).to respond_to('take_off')
  end

  # test 2
  it "lands planes" do
    my_plane = Plane.new()
    my_airport = Airport.new
    allow(my_airport.weather).to receive(:stormy?) { false }
    my_airport.take_off(my_plane)
    my_airport.land(my_plane)
    expect(my_airport.planes.last).to eq my_plane
  end

  it "take off plane" do
    my_airport = Airport.new
    allow(my_airport.weather).to receive(:stormy?) { false }
    5.times { my_airport.land(Plane.new) }
    planes_at_airport = my_airport.planes.length
    my_airport.take_off(my_airport.planes.first)
    expect(my_airport.planes.length).to eq planes_at_airport - 1
  end
end
