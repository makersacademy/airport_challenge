require "airport.rb"

describe Airport do
  it "allows air traffic controller to instruct planes to land" do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    expect(airport.return_planes).to eq [plane]
  end
end