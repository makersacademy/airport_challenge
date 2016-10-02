describe Airport do
#As an air traffic controller
#So I can get passengers to a destination
#I want to instruct a plane to land at an airport and confirm that it has landed
  it 'airport can instruct plane to land at airport' do
    airport = Airport.new(50)
    plane = Plane.new
    expect { airport.land(plane) }
  end

#As an air traffic controller
#So I can get passengers on the way to their destination
#I want to instruct a plane to take off from an airport and
#confirm that it is no longer in the airport

  it 'airport can instruct plane to take off' do
    airport = Airport.new(50)
    plane = Plane.new
    expect { airport.take_off(plane) }
  end

  it "airport can confirm that the plane is no longer in the airport" do
    airport = Airport.new(50)
    plane = Plane.new
    expect { airport.take_off(plane) }
  end

#As an air traffic controller
#To ensure safety
#I want to prevent landing when the airport is full

  it "airport can prevent plane from landing if airport is full" do
    airport = Airport.new(50)
    plane = Plane.new
    50.times do
      airport.land(plane)
    end
    expect { airport.land(plane)}.to raise_error "airport is full, can't land plane"
  end
end
