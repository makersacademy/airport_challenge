describe Userstories do
  it "So planes land at airports, instruct a plane to land" do
    airport = Airport.new(10)
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end

  it "So planes take off from airports, instruct planes to take off" do
    airport = Airport.new(10)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end

  it "Does not allow planes to land when airport is full" do
    airport = Airport.new(10)
    plane = Plane.new
    10.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error "Can't land, airport full"
  end
end
