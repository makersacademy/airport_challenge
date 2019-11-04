require './lib/airport'

describe Airport do
  it "makes an instance of the Airport class" do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
  end

  it { should respond_to(:land).with(1).argument }

  it { should respond_to(:take_off).with(1).argument }

  it "should show a plane that has landed" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end

  it "should confirm a plane is no longer in the airport after take off" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off(plane)).to eq []
  end

  it "should prevent landing when the aiport is full" do
    airport = Airport.new
    expect { (Airport::DEFAULT_AIRPORT_CAPACITY + 1).times { airport.land(Plane.new) } }.to raise_error "Airport is full"
  end

  it "defaults to a capacity equal to the default airport capacity" do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_AIRPORT_CAPACITY
  end

  it "should allow the user to specify a different capacity" do
    capacity = 15
    airport = Airport.new(15)
    expect(airport.capacity).to eq capacity
  end

  it "should only allow planes present in the airport to take off from the airport" do
    airport = Airport.new
    plane = Plane.new
    expect { airport.take_off(plane) }.to raise_error "Plane not in airport"
  end

end
