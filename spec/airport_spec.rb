require "./lib/airport.rb"

describe Airport do 
  it "releases a plane" do
    airport = Airport.new
    expect(airport).to respond_to(:release_plane)
  end

  it "lands a plane" do
    airport = Airport.new
    plane1 = airport.release_plane
    expect(airport.land(plane1)).to eq("Plane has landed")
  end

  it "departs plane and confirmation" do
    airport = Airport.new
    plane1 = airport.release_plane
    expect(airport.depart(plane1)).to eq("Plane no longer in airport")
  end

  it "issues warning not to land if weather is stormy" do
    airport = Airport.new
    plane1 = airport.release_plane
    expect(airport.not_safe_to_land(plane1)).to eq("Warning! Bad weather, do not land plane")
  end

  it "departs plane if weather is sunny" do
    airport = Airport.new 
    expect(airport.weather_outlook).to eq("Plane has landed")
  end

  # This test does not work - need to look into why plane lands instead of issue issuing a warning?
  it "does not land plane if weather is stormy" do
    airport = Airport.new 
    expect(airport.weather_outlook).to eq("Warning! Bad weather, do not land plane")
  end
  
end 