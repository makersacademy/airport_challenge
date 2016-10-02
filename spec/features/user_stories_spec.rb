describe 'user stories' do
#As an air traffic controller
#So I can get passengers to a destination
#I want to instruct a plane to land at an airport and confirm that it has landed
  it 'airport can instruct plane to land at airport' do
    airport = Airport.new(50)
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end

  it 'airport can confirm that a plane has landed at airport' do
    airport = Airport.new(50)
    plane = Plane.new
    expect { airport.confirm_land(plane) }.not_to raise_error
  end
#As an air traffic controller
#So I can get passengers on the way to their destination
#I want to instruct a plane to take off from an airport and
#confirm that it is no longer in the airport

  it 'airport can instruct plane to take off' do
    airport = Airport.new(50)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end

  it "airport can confirm that the plane is no longer in the airport" do
    airport = Airport.new(50)
    plane = Plane.new
    expect { airport.confirm_take_off(plane) }.not_to raise_error
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
    expect { airport.land(plane) }.to raise_error "airport is full, can't land plane"
  #   allow(airport).to respond_to(:full?).and_return true
  end

#As an air traffic controller
#To ensure safety
#I want to prevent takeoff when weather is stormy

  # it "airport can prevent plane takeoff when weather is stormy" do
  #   airport = Airport.new(50)
  #   plane = Plane.new
  #   allow(airport).to receive(:stormy?).and_return true
  #   expect { airport.take_off(plane) }.to raise_error "weather is stormy, can't take off"
  # end

#As an air traffic controller
#To ensure safety
#I want to prevent landing when weather is stormy

  # it "airport can prevent plane from landing when weather is stormy" do
  #   airport = Airport.new(50)
  #   plane = Plane.new
  #   allow(airport).to receive(:stormy?).and_return true
  #   expect { airport.land(plane) }.to raise_error "weather is stormy, can't land plane"
  # end
end
