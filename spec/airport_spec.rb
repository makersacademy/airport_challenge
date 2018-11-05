require 'airport'
require 'plane'
describe Airport do
  let(:airport) {airport = Airport.new}
  let(:plane) {plane = Plane.new}
  it "plane landed at airpot" do
    airport.weather = "good"
    airport.land(plane)
    expect(airport.capacity).to eq [plane]
  end
  it "plane released for take off" do
    airport.weather = "good"
    airport.land(plane)
    expect(airport.take_off?).to eq true
    expect(airport.capacity).to eq []
  end
  it "the weather is stormy" do
      airport.weather = "stormy"
      expect(airport.weather).to eq "stormy"
  end
  it "doesn't release plane when weather is stormy" do
    airport.weather = "stormy"
    airport.capacity << plane
    expect(airport.take_off?).to eq false
    expect(airport.capacity). to eq [plane]
  end
  it "doesn't land plane when weather is stormy" do
    airport.weather = "stormy"
    expect(airport.land(plane)).to eq false
  end
  it "doesn't release a plane for take off when there are no planes" do
    airport.weather = "good"
    expect(airport.take_off?).to eq false
  end
  it "returns true if the airport is full" do
    airport.weather = "good"
    airport.land(plane)
    expect(airport.full?).to eq true
  end
  it "doesn't land a plane if the airport is full" do
    airport.weather = "good"
    airport.land(plane)
    expect(airport.land(plane)).to eq false
  end
  it "sets a default capacity if no argument provided" do
    airport_2 = Airport.new
    expect(airport_2.size). to eq Airport::DEFAULT_CAPACITY
  end
  it "sets the size to the argument provided" do
    airport_1 = Airport.new(10)
    expect(airport_1.size).to eq 10
  end
end
