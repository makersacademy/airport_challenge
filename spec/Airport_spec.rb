require "./lib/Airport.rb" 
require "./lib/Plane.rb"

describe Airport do
  
  it 'Airport to receive plane' do
    plane = Plane.new
    airport = Airport.new
    expect(airport).to respond_to :land_plane
  end

  it "Airport to remove plane and confirm it's left" do
    plane = Plane.new
    airport = Airport.new
    airport.land_plane(plane)
    expect{airport.depart_plane(plane)}.to raise_error("Plane has left") # cheating with error message - not entirely correct
  end

end