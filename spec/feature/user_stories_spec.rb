describe "user stories" do
  # As an air traffic controller
  # So planes can land safely at my airport
  # I would like to instruct a plane to land

  it "instruct the airport to land" do
    airport = Airport.new
    plane = Plane.new
    expect{ airport.land(plane) }.to_not raise_error
  end

end
