require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }
  it "responds to land" do
    expect(airport).to respond_to(:land).with(1).argument
  end
  xit "lands plane in airport" do
    expect(airport.land(plane)).to include(plane)
  end
  it "responds to take-off" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
  it "takes off from airport" do
    allow(:airport).to receive(:weather)
    expect(airport.take_off(plane)).to eq(plane)
  end
  xit "can't land when already landed" do
    airport.land(plane)
    expect{airport.land(plane)}.to raise_error("That plane has already landed!")
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
