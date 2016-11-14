describe Airport do

  it "Responds to a method called land_plane" do
    airport = Airport.new
    expect(airport).to respond_to(:land_plane)
  end

  it "Can confirm a plane has landed" do
    plane = Plane.new
    airport.land_plane(plane)
    # expect(airport.take_off(plane)).to eq false
  end

  it "Can give a command for planes to take off" do
    plane = Plane.new
    airport.take_off(plane)
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it "Can talk to the plane to confirm it's taken off" do
    plane = Plane.new
    airport.take_off(plane)
    expect(airport.confirm).to respond_to(:confirm)
  end

  it "Doesn't allow plane to land in stormy weather" do
    storm = Weather.new
    expect(airport.land_plane.storm).to raise_error("Storm! Unable to land!")

  end

end

describe Weather do

  it "Is mostly sunny but sometimes stormy" do
    weather = Weather.new
    expect(weather.forcast.stormy?).to eq(Weather)
  end


end
