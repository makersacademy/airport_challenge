describe 'These are user stories' do
  
  #  User story 1

  # As an air traffic controller 
  # So I can get passengers to a destination 
  # I want to instruct a plane to land at an airport.

    it 'instruct a plan to land at the airport.' do
      airport = Airport.new(30)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return false
      expect { airport.land(plane) }.not_to raise_error
    end

  #  User story 2

  # As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

    it 'instructs a plane to take off and confirm that it is no longer in the airport' do
      airport = Airport.new(30)
      plane = Plane.new
      expect { airport.take_off(plane) }.not_to raise_error
    end

  # User story 3

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when the airport is full

  it 'instructs a plane NOT to land when no capacity in the airport' do
    airport = Airport.new(30)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    30.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error 'Unable to land plane: no empty spaces.'
  end

  # User story 4

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate

  # User story 5

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent takeoff when weather is stormy

  it 'will not allow lanidng when stormy' do
    airport = Airport.new(30)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error 'Unable to land plane: stormy weather.'
  end
end
