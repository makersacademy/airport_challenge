require 'airport'

describe Airport do
  it 'responds to land with 1 argument passed' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'takes off a plane and confirms it has taken off' do # I'm not sure if this test and corresponding method is doing too much
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq("#{plane} has taken off")
  end

  it 'checks that a plane is no longer at the airport after take-off' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.planes_at_airport).not_to include plane
  end

  it 'raises an error if plane tries to take off from an airport it is not at' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    airport.takeoff(plane)
    expect { airport.takeoff(plane) }.to raise_error "Plane is not at this airport"
  end

  it 'raises an error if a plane tries to land when it is already on the ground' do
    plane = Plane.new
    heathrow = Airport.new
    gatwick = Airport.new
    heathrow.land(plane)
    error_message = "Plane cannot land as it is already on the ground"
    expect { gatwick.land(plane) }.to raise_error error_message
  end

  it "won't accept more planes than the airport capacity" do
    airport = Airport.new
    airport.capacity.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error "Airport is at capacity"
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'uses capacity where specified' do
    capacity = 20
    airport = Airport.new(20)
    expect(airport.capacity).to eq capacity
  end

end
