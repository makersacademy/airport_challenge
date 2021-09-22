require 'airport'
require 'plane'

describe Airport do
  airport = Airport.new(10)
  plane2 = Plane.new

  it "prevents landing when airport is full" do
    plane2.land(airport)
    airport.landed_planes << [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    expect(plane2.current_airport).to eq nil if airport.capacity >= airport.landed_planes.count
  end
end