require "airport_class.rb"

describe "Airport" do

  it "has a land_plane method" do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    expect(airport.planes.length).to eq 1
  end
end
