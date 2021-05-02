describe 'user stories' do

  # As an air traffic controller 
  # So I can get passengers to a destination 
  # I want to instruct a plane to land at an airport
  it "instruct a plane to land" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(plane) }.not_to raise_error 
  end

  # As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off from an airport
  it "instruct a plane to take off" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.take_off(plane) }.not_to raise_error 
  end

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when the airport is full 
  it "stops planes landing when full" do
    airport = Airport.new
    allow(airport).to receive(:stormy?).and_return false
    20.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error "Airport full"
  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate
  it "stops planes landing when full" do
    airport = Airport.new(40)
    allow(airport).to receive(:stormy?).and_return false
    40.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error "Airport full"
  end

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when weather is stormy 
  it "doesn't allow planes to land when stormy" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error "Cannot land due to bad weather"
  end

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent taking off when weather is stormy 
  it "doesn't allow planes to take off when stormy" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.take_off(plane) }.to raise_error "Cannot take off due to bad weather"
  end

end