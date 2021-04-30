describe 'user stories' do
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  it "so planes can land at airports, instructs a plane to land" do
    airport = Airport.new(10)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(plane) }.not_to raise_error
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that
  # it is no longer in the airport.
  it "so planes can take off from airports, instruct a plane to take off" do
    airport = Airport.new(10)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full
  context "When the airport is full" do
    it "Does not allow planes to land" do
      airport = Airport.new(10)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return false
      10.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error "Plane cannot land at a full airport!"
    end
  end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing/takeoff when weather is stormy.
  context "When weather is stormy" do
    it "Does not allow planes to land" do
      airport = Airport.new(10)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error "Plane cannot land during stormy conditions!"
      end
    end
end
