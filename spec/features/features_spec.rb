describe "features" do 
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  it 'instructs a plane to land so passengers get to a destination' do
    heathrow = Airport.new(50)
    plane = Plane.new
    expect { heathrow.land(plane) }.not_to raise_error
  end

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it 'instructs a plane to take off so passengers get to a destination' do
    heathrow = Airport.new(50)
    plane = Plane.new
    expect { heathrow.take_off(plane) }.not_to raise_error
  end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 
  context 'when the airport is full' do

    it 'does not allow plane to land to ensure safety' do
      airport = Airport.new(50)
      plane = Plane.new
      50.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error('The airport is full.')
    end

  end
end
