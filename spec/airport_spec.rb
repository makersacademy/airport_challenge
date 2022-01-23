require 'airport'

describe Airport do 
  it "releases a plane" do
    airport = Airport.new
    expect(airport).to respond_to(:release_plane)
  end

  it "instruct a plane to land at airport" do
    airport = Airport.new
    my_plane = airport.release_plane
    expect(airport.land_plane(my_plane)).to eq("Plane has Landed")
  end 

  it "instruct a plane to take off and confirmed" do
    airport = Airport.new
    my_plane = airport.release_plane
    expect(airport.takeoff_plane(my_plane)).to eq("Plane is not in the airport")
  end
end