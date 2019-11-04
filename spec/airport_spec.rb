require "airport"

describe Airport do
  it { is_expected.to respond_to :planes }

  it "has a default capacity that can be changed" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    airport = Airport.new 100
    expect(airport.capacity).to eq(100)
  end

  it "stores an array of planes landed at the airport" do
    airliner = Plane.new
    airport = Airport.new
    airport.land(airliner)
    expect(airport.planes).to eq([airliner])
  end
end
