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
    Airport::DEFAULT_WEATHER = 2
    expect{airport.depart_plane(plane)}.to raise_error("Plane has left")
  end

  it 'create a default capacity for the land_plane function that caps max planes planed' do
    airport = Airport.new
    Airport::DEFAULT_CAPACITY.times {airport.land_plane(Plane.new)}
    expect{airport.land_plane(Plane.new)}.to raise_error("No bays available")
  end

  it 'to ensure safety: Stop takeoff when weather is stormy to output true' do
    plane = Plane.new
    airport = Airport.new
    Airport::DEFAULT_WEATHER = 6
    expect{airport.depart_plane(Plane.new)}.to raise_error("Takeoff not safe: Stormy weather")
  end

  it 'to ensure safety: Stop land_plane when weather is stormy to output true' do
    plane = Plane.new
    airport = Airport.new
    Airport::DEFAULT_WEATHER = 6
    expect{airport.land_plane(Plane.new)}.to raise_error("Landing not safe: Stormy weather")
  end


  As an air traffic controller 
  To ensure safety 
  I want to prevent landing when weather is stormy 

end