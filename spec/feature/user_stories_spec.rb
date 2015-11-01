describe "user stories" do
  # As an air traffic controller
  # So planes can land safely at my airport
  # I would like to instruct a plane to land

  it "so planes can land, instruct the airport to land" do
    airport = Airport.new
    plane = Plane.new
    expect{ airport.land(plane) }.to_not raise_error
  end

  # As an air traffic controller
  # So planes can take off safely from my airport
  # I would like to instruct a plane to take off

  it 'so planes take_off from airports, instruct a plane to take off' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end

end
