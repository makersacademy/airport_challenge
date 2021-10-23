require './lib/airport'
require './lib/plane'

describe Airport do
  let(:plane) { Plane.new}
  let(:airport) {Airport.new}

  describe "land" do
  it "instructs a plane to land" do
    expect(airport).to  respond_to(:land).with(1).argument
  end

  it "prevents landing when airport is full" do
    airport.capacity.times{ airport.land(plane) }
    expect{ airport.land plane }.to raise_error "This airport is full"
  end
end

  describe "take_off" do
  it "instructs a plane to take off" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it "confirms a plane is no longer in the airport" do
    allow(airport).to receive(:stormy?).and_return false
    expect(airport.take_off(plane)).to eq "Taken Off"
  end

  it "prevents take off when weather is stormy" do
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.take_off(plane) }.to raise_error "Can't take off weather is stormy"
  end
end

  it "has a default capacity" do
    expect(airport.capacity).to eq Airport::DEFAUlT_CAPACITY
  end


end