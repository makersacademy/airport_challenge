require "airport.rb"

describe Airport do
  it "air traffic controller instructs planes to land" do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    expect(airport.return_planes).to eq [plane]
  end

  it "air traffic controller instructs planes to take off" do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    airport.take_off(plane)
    expect(airport.return_planes).to eq []
  end
end
