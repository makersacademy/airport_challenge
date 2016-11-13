describe Airport do

  it "Responds to a method called land_plane" do
    airport = Airport.new
    expect(airport).to respond_to(:land_plane)
  end

  it "Can give a command for planes to take off" do
    plane = Plane.new
    airport.take_off(plane)
    expect(airport).to respond_to(:take_off).with(1).arguement
  end

end
