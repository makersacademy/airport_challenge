require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { Plane.new }
  it "responds to land" do
    expect(airport).to respond_to(:land).with(1).argument
  end
  it "lands plane in airport" do
    expect(airport.land(plane)).to be_an_instance_of(Plane.new)
  end
  it "responds to take-off" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
  it "takes off from airport" do
    expect(airport.take_off(plane)).to be_an_instance_of(Plane.new)
  end
    it "can't land when already landed" do
      airport = double("airport", :weather => 0 ) # working out how to add a stub
    airport.land(plane)
    expect {airport.land(plane)}.to raise_error("That plane has already landed!")
  end
  it "sets default capacity" do
    DEFAULT_CAPACITY = 60
    expect(subject.capacity).to eq 60
  end
  it "set user-require capacity" do
    airport = Airport.new(34)
    expect(airport.capacity).to eq 34
  end

end
