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

  it "departs plane if weather is sunny" do
    airport = Airport.new
    weather1 = airport.weather_access
    expect(airport.weather_outlook).to eq("Plane has landed")
  end
  
end 