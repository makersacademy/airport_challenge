require './lib/airport'

describe Airport do
  it "makes an instance of the Airport class" do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
  end

  it { should respond_to(:land).with(1).argument}

  it { should respond_to(:take_off).with(1).argument}

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
    airport.land(Plane.new)
    expect { airport.land(Plane.new) }.to raise_error "Airport is full"
  end

end
