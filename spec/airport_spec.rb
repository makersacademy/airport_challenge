require 'airport'

describe Airport do

  it { is_expected.to be_an_instance_of(Airport) }

  it "should raise error for creating an airport with no space for planes" do
    expect { Airport.new("Heathrow", 0) }.to raise_error "You cannot create an airport with no space for planes!"
  end

  it "should return airport name as a symbol" do
    expect(subject.name).to be_a(Symbol)
  end

  it "should return airport space as an integer" do
    expect(subject.airport_space).to be_a(Integer)
  end

  it "should return landing area as an array" do
    expect(subject.landing_area).to be_a(Array)
  end

  it "should accept add plane method" do
    fake_plane = double("fake_plane")
    expect(subject).to respond_to(:add_plane_to_airport).with(1)
  end

  it "should raise error for searching for a non-Plane object at the airport" do
    fake_plane = double("fake_plane")
    expect { subject.plane_at_airport?(fake_plane) }.to raise_error "Not a plane!"
  end

  it "should accept 'land' method for landing" do
    expect(subject).to respond_to(:accept_landing).with(1)
  end

  it "should return the gate number of plane at airport" do
    airport = Airport.new
    plane = Plane.new
    airport.add_plane_to_airport(plane)
    allow(airport).to receive(:collect).and_return(["Gate Number 1: #{plane}"])
    expect(airport.show_planes).to eql(["Gate Number 1: #{plane}"])
  end

  it "should raise an error for argument not being an instance of 'Plane'" do
    fake_plane = double("fake_plane")
    expect { subject.add_plane_to_airport(fake_plane) }.to raise_error "Not a plane!"
  end

  it "should only accept an instance of 'Plane' for landing" do
    fake_plane = double("not_a_plane")
    weather = Weather.new
    weather.instance_variable_set("@state", 1)
    expect { subject.accept_landing(fake_plane, weather) }.to raise_error "Not a plane, please do not land!"
  end

  it "should accept 'take_off' method" do
    expect(subject).to respond_to(:take_off).with(2)
  end

end
