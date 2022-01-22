require './lib/airport.rb'

describe Airport do 
  it "instruct a plane to land at airport" do
    airport = Airport.new
    expect(airport.land_plane).to eq("Plane Landed")
  end 
  it "instruct a plane to take off from an airport" do
    airport = Airport.new
    expect(airport.takeoff_plane).to eq("Plane is flying")
  end

  it "confirm that it is no longer in the airport" do
    airport = Airport.new
    expect(airport.flying_plane).to eq("Plane is not in the airport")
  end

  

end
