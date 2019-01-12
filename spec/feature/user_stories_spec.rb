describe 'User Stories' do

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
  it 'so planes land at airport' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(:plane) }.not_to raise_error
  end

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to *take off* at an airport
  it 'so planes take off from airport' do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.take_off(:plane) }.not_to raise_error
  end

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
  it "so planes do not land when the airport is full" do
    airport = Airport.new(20)
    planes = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    20.times do
      airport.land(:plane)
    end
      expect { airport.land(:plane) }.to raise_error "Cannot land plane: airport is full"
    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent *takeoff or landing * when weather is stormy
    it "so planes don't take off when stormy" do
      airport = Airport.new(20)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(:plane) }.to raise_error "Cannot land plane: weather is stormy"
    end
 end
