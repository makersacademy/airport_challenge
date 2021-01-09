describe 'User Stories' do

  # I want to instruct a plane to land at an airport

  it 'instruct a plane to land at an airport' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect {airport.land(plane)}.not_to raise_error
  end

  # I want to instruct a plane to take off from an airport

  it 'instruct a plane to take off from an airport' do
    airport = Airport.new(20)
    plane = Plane.new
    expect {airport.take_off(plane)}.not_to raise_error
  end

  # I want to prevent landing when the airport is full 
  context 'when airport is full' do
    it 'does not allow planes to land' do
      airport = Airport.new(20)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return false
      20.times {airport.land(plane)}
      expect { airport.land(plane) }.to raise_error "Cannot land plane - airport full"
    end
  end

  # I want to prevent landing when weather is stormy 
  context 'when weather is stormy' do
    it 'does not allow planes to land' do
      airport = Airport.new(20)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error "Cannot land plane - stormy weather"
    end
  end

end