require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  it "responds to land" do
    expect(airport).to respond_to(:land).with(1).argument
  end
  it "lands plane in airport" do
    expect(airport.land(plane)).to include(plane)
  end
  it "responds to take-off" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
  it "can't land when already landed" do
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
