describe "Features" do 
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  it 'instructs a plane to land so passengers get to a destination' do
    heathrow = Airport.new(50)
    plane = Plane.new
    allow(heathrow).to receive(:stormy?).and_return(false)
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
      heathrow = Airport.new(50)
      plane = Plane.new
      allow(heathrow).to receive(:stormy?).and_return(false)
      50.times { heathrow.land(plane) }
      expect { heathrow.land(plane) }.to raise_error('The airport is full.')
    end

  end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

  context 'when the weather is stormy' do

    it 'does not allow plane to land to ensure safety' do
      airport = Airport.new(50)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error('Cannot land - it is stormy.')
    end
  end 
end
